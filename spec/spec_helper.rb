require "capybara/rspec"

RSpec.configure do |config|

  # Apartment Configuration
  config.before(:suite) do
    # Clean all tables to start
    # DatabaseCleaner.clean_with :truncation
    # Use transactions for tests
    DatabaseCleaner.strategy = :transaction
    # This section is removed since the new rake task drops schemas before running rspec
    # ( Run "rake rspec [args]" instead of "rspec [args]")
    # Truncating doesn't drop schemas, ensure we're clean here, app *may not* exist
    # Apartment::Tenant.each do |t|
    #   Apartment::Tenant.drop(t) rescue nil
    # end
    # Create the default tenant for our tests
    # Rails.application.load_seed # loading seeds
    # unless Entity.count > 0
    #   Apartment::Tenant.drop "avaya" rescue nil
    #   Entity.create!(name: "Avaya", tenant_name: "avaya", admin_email: "admin@avaya.com", temporary_password: "password", key: "123456")
    # end

    # Apartment::Tenant.reset
    # Apartment::Tenant.drop("avaya") rescue nil

    # Entity.create!(name: "Avaya", tenant_name: "avaya", admin_email: "admin@avaya.com", temporary_password: "password", key: "123456")
  end

  config.before(:each) do
    # Start transaction for this test
    DatabaseCleaner.start
  end

  config.after(:each) do
    # Rollback transaction
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true # Prevents stubbing any methods that don’t already exist on an object
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.default_formatter = "doc" if config.files_to_run.one? # More friendly messages if one file to run

  config.order = :random # To ensure tests independency from each other

  # Kernel.srand config.seed
end