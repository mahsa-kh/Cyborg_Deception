require 'test_helper'

class DecoysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get decoys_index_url
    assert_response :success
  end

  test "should get new" do
    get decoys_new_url
    assert_response :success
  end

  test "should get create" do
    get decoys_create_url
    assert_response :success
  end

  test "should get show" do
    get decoys_show_url
    assert_response :success
  end

  test "should get edit" do
    get decoys_edit_url
    assert_response :success
  end

  test "should get update" do
    get decoys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get decoys_destroy_url
    assert_response :success
  end

end
