require 'test_helper'

class Spina::Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spina_admin_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get spina_admin_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get spina_admin_posts_edit_url
    assert_response :success
  end

end
