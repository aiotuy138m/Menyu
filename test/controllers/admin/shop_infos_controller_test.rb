require "test_helper"

class Admin::ShopInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_shop_infos_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_shop_infos_edit_url
    assert_response :success
  end
end
