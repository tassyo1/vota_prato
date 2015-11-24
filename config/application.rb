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
  end
end
