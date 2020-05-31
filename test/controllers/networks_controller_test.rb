require 'test_helper'

class NetworksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get networks_index_url
    assert_response :success
  end

  test "should get show" do
    get networks_show_url
    assert_response :success
  end

  test "should get create" do
    get networks_create_url
    assert_response :success
  end

  test "should get update" do
    get networks_update_url
    assert_response :success
  end

  test "should get delete" do
    get networks_delete_url
    assert_response :success
  end

end
