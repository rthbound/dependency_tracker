ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "pry"
require "rails/test_help"
require 'minitest/spec'
require "minitest/rails"
require "minitest/autorun"
require 'minitest/matchers'
require 'minitest/reporters'
require "minitest-colorize"
require "mocha/setup"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
