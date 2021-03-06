ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require "shoulda/matchers"
require "factory_girl"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

   config.filter_rails_from_backtrace!
  
   #FactoryGirls e DatabaseCleaner
  config.include FactoryGirl::Syntax::Methods
  
  config.before(:suite) do
     begin
       DatabaseCleaner.start
       FactoryGirl.lint
     ensure
       DatabaseCleaner.clean
     end
   end
end

#Shoulda Matchers configuration
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
