require 'rubygems'
require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'seeder'

ActiveRecord::Migration.maintain_test_schema!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.order = :random
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.render_views = true
  config.global_fixtures = :all
  config.fixture_path = Rails.root.join('spec', 'fixtures')
  config.include Capybara::DSL
  config.include Devise::TestHelpers, type: :controller
  config.include ActiveJob::TestHelper
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
  # Blacklist any HTTP calls that might be made during JS tests, such
  # as hard-coded image URLs, Google fonts, etc
  Capybara::Webkit.configure do |config|
    config.block_unknown_urls
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.syntax = :expect
  end

  config.before(:each) do
    Seeder.populate
  end
end
