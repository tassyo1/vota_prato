require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module VotaPrato
  class Application < Rails::Application
    
    console do
      require "pry"
      config.console = Pry
      unless defined? Pry::ExtendCommandBundle
        Pry::ExtendCommandBundle = Module.new
      end
      require "rails/console/app"
      require "rails/console/helpers"
      TOPLEVEL_BINDING.eval('self').extend ::Rails::ConsoleMethods
    end

    config.active_record.raise_in_transactional_callbacks = true

    #Rspec Configuration
    config.generators  do|g|
       g.test_framework :rspec, :view_specs => false,
         :controller_specs => false,
         :helper_specs => false,
         :routing_specs => false,
         :request_specs => false
    end
  end
end
