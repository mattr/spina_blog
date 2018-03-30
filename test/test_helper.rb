# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
require "rails/test_help"
# require "minitest/reporters"
require 'spina'
require 'factory_bot'
require 'mocha/minitest'

# Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

# Rails.root is /test/dummy, and it looks inside here for the definitions, so we
# need to backtrace to the test directory.
FactoryBot.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryBot.find_definitions


# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new


# Bunch of deprecation warnings in controller tests, so we'll silence these since that's in
# the 'spina' gem, not ours.
ActiveSupport::Deprecation.silenced = true

# # Load fixtures from the engine
# if ActiveSupport::TestCase.respond_to?(:fixture_path=)
#   ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
#   ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
#   ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
#   ActiveSupport::TestCase.fixtures :all
# end
