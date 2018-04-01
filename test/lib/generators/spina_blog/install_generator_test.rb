require 'test_helper'
require 'generators/spina_blog/install/install_generator'

class SpinaBlog::InstallGeneratorTest < Rails::Generators::TestCase
  tests SpinaBlog::InstallGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
