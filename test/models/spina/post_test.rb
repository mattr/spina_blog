require 'test_helper'

class Spina::PostTest < ActiveSupport::TestCase
  # fixtures :all
  # set_fixture_class post: Spina::Post

  setup do
    # @post = spina_posts(:valid)
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
