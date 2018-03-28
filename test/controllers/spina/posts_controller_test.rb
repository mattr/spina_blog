require 'test_helper'

class Spina::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spina_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get spina_posts_show_url
    assert_response :success
  end

end
