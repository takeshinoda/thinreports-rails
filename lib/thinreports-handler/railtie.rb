require 'rails'

module ThinreportsHandler
  class Railtie < ::Rails::Railtie
    initializer 'thinreports-handler' do
      ::ActiveSupport.on_load(:action_view) do
        ::Mime::Type.register('application/pdf', :pdf) unless ::Mime::Type.lookup_by_extension(:pdf)
        require 'thinreports-handler/template_handler'
      end
    end
  end
end

