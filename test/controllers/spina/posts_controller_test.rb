require 'test_helper'

class Spina::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = FactoryBot.create(:post)
  end

  test "should get index" do
    get spina.blog_root_url
    assert_response :success
  end

  test "should get show" do
    get spina.blog_post_url, params: { id: @post.id }
    assert_response :success
  end

end
