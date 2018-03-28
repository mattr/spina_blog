require 'test_helper'

class Spina::TagTest < ActiveSupport::TestCase
  setup do
    @tag = create(:tag)
  end

  test "valid" do
    assert @tag.valid?
  end

  test "should require name" do
    tag = Spina::Tag.new
    refute tag.valid?
    assert_not_nil tag.errors.include?(:name)
  end
end
