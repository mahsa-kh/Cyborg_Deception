require 'test_helper'

class DecoyTemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get decoy_templates_index_url
    assert_response :success
  end

  test "should get new" do
    get decoy_templates_new_url
    assert_response :success
  end

  test "should get create" do
    get decoy_templates_create_url
    assert_response :success
  end

  test "should get show" do
    get decoy_templates_show_url
    assert_response :success
  end

  test "should get edit" do
    get decoy_templates_edit_url
    assert_response :success
  end

  test "should get update" do
    get decoy_templates_update_url
    assert_response :success
  end

  test "should get destroy" do
    get decoy_templates_destroy_url
    assert_response :success
  end

end
