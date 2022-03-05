require "simplecov"
# The following line disables result_merger module and it causes problems in rspec testing in NFS environment (i.e Vagrant)
SimpleCov.use_merging false
SimpleCov.start

SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_filter "spec/"
  add_filter "db/migrate"
  add_filter "log"
  add_filter "lib"
  add_filter "public"
  add_filter "config"
  add_filter "bin"
  add_filter "assets"
  add_filter "app/jobs"
  add_filter "app/mailers"
  add_filter "app/assets"
  add_filter "app/channels"
  add_filter "app/helpers"
  add_filter "app/jobs"
  add_filter "app/models/weather"
end
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
require "capybara/poltergeist"
# require "database_cleaner"
Rails.application.eager_load! if Rails.env.test?

# Capybara.server = :puma, { Silent: true } # Only need if using Rails 5.0+
# Capybara.javascript_driver = :webkit

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include RequestSpecHelper, type: :request

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: %w(ar_internal_metadata entities))
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end