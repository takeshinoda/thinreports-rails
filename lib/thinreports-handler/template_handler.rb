# encoding: utf-8
require 'delegate'
require 'active_support/core_ext'
require 'thinreports'

module ThinreportsHandler
  class ThinreportsTemplate < SimpleDelegator  
    attr_accessor :_generate_options

    def initialize(thinreports_report_base_obj, template_context, template_virtual_path)
      @_template_context = template_context
      @_template_virtual_path = template_virtual_path
      super(thinreports_report_base_obj)
    end

    def partial!(options, locals = {})
      case options
      when Hash
        options[:locals] ||= {}
        options[:locals].merge!(:report => self)
        @_template_context.render(options)
      else
        @_template_context.render(options, locals.merge(:report => self))
      end
    end

    def search_tlf_path(virtual_path)
      virtual_path ? virtual_path + '.tlf': "#{@_template_virtual_path}.tlf"
    end

    def generate_options(options)
      self._generate_options = options
    end

    def set_layout(options = {})
      _options = options ? options.dup: {}
      tlf_path = search_tlf_path(_options[:tlf])

      ActionController::Base.view_paths.each do |view_path|
        full_path = File.join(view_path.to_s, tlf_path)
        if File.exist?(full_path)
          return self.use_layout(full_path, *([_options[:layout_options]].compact))
        end
      end
      raise("#{tlf_path} not found.")
    end
  end

  class TemplateHandler
    cattr_accessor :default_format
    self.default_format = 'application/pdf'

    def self.call(template)
      %{
        if defined?(report)
          #{template.source}
        else
          generate_options = nil
          ThinReports::Report.create do |__report__|
            report = ThinreportsHandler::ThinreportsTemplate.new(__report__, self, '#{template.virtual_path}') 

            #{template.source}

            generate_options = report._generate_options
          end.generate(*([generate_options].compact))
        end
      }
    end
  end
end

ActionView::Template.register_template_handler :thinreports, ThinreportsHandler::TemplateHandler

