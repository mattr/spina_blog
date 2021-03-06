require 'test_helper'

class Spina::Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = FactoryBot.create(:post)
    FactoryBot.create(:account)
    @user = @post.author
    post spina.admin_sessions_url, params: { email: @user.email, password: @user.password }
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
    assert_difference('Spina::Post.count') do
      post spina.admin_posts_url, params: { post: FactoryBot.attributes_for(:post) }
    end
    assert_not_empty flash
    assert_response :redirect
    assert_redirected_to spina.admin_blog_url
    follow_redirect!
    assert_response :success
  end

  test "should update post" do
    @post.title = "New title"
    # patch spina.admin_post_url(@post), params: { id: @post.id, post: @post.attributes }
    patch spina.admin_post_url(@post), params: { post: @post.attributes }
    assert_response :redirect
    assert_redirected_to spina.admin_blog_url
    follow_redirect!
    assert_response :success
  end

  test "should delete post" do
    assert_difference('Spina::Post.count', -1) do
      delete spina.admin_post_url(@post)
    end
    assert_response :redirect
    assert_redirected_to spina.admin_blog_url
    follow_redirect!
    assert_response :success
  end

end
