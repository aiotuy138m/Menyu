require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_posts_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_posts_edit_url
    assert_response :success
  end
end
