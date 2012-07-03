require 'rails'

module ThinreportsRails
  class Railtie < ::Rails::Railtie
    initializer 'thinreports-rails' do
      ::ActiveSupport.on_load(:action_view) do
        ::Mime::Type.register('application/pdf', :pdf) unless ::Mime::Type.lookup_by_extension(:pdf)
        require 'thinreports-rails/template_handler'
      end
    end
  end
end

