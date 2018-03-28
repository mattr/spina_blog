require 'test_helper'

class Spina::Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = spina_posts(:valid)
    @controller.stubs(:current_spina_user).returns(spina_users(:author))
  end

  test "should get index as blog" do
    get spina.admin_blog_url
    assert_equal "index", @controller.action_name
    assert_response :success
  end

  test "should get index as posts" do
    get spina.admin_posts_url
    assert_response :success
  end

  test "should get new" do
    get spina.new_admin_post_url
    assert_response :success
  end

  test "should get edit" do
    get spina.edit_admin_post_url(@post)
    assert_response :success
  end

  test "should create post" do
    post spina.admin_posts_url, params: { post: { title: "Create post", is_draft: true } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should update post" do
    @post.title = "New title"
    patch spina.admin_post_url(@post)
    assert_response :success
  end

end
