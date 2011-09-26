ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

if ENV['TRAVIS']
  configs                             = YAML.load_file('test/database.yml')
  ActiveRecord::Base.configurations   = configs

  db_name                             = ENV['DB'] || 'sqlite'
  ActiveRecord::Base.establish_connection(db_name)
  ActiveRecord::Base.default_timezone = :utc
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
