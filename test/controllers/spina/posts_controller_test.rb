require 'test_helper'

class Spina::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = FactoryBot.create(:post)
  end

  test "should get index" do
    get spina.blog_root_url
    assert_response :success
  end

  test "should get show from materialized path" do
    get spina.blog_post_url(@post.materialized_path)
    assert_response :success
  end

  test "should only show published post" do
    @post.update(is_draft: true)
    get spina.blog_post_url(@post)
    assert_response :success
  end

  test "should get preview of draft post" do
    post = create(:post, { is_draft: true, author: @post.author })
    get spina.blog_post_preview_url(post.materialized_path)
    assert_response :success
  end

end
