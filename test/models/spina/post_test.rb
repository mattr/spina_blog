require 'test_helper'

class Spina::PostTest < ActiveSupport::TestCase

  setup do
    @post = FactoryBot.create(:post)
  end

  test "should require title" do
    post = Spina::Post.new
    refute post.valid?
    assert_not_nil post.errors.include?(:title)
  end

  test "should have an author" do
    assert_not_nil @post.author.name
  end
end
