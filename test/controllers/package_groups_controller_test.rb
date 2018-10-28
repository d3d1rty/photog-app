require 'test_helper'

class PackageGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get package_groups_new_url
    assert_response :success
  end

  test "should get edit" do
    get package_groups_edit_url
    assert_response :success
  end

  test "should get create" do
    get package_groups_create_url
    assert_response :success
  end

  test "should get update" do
    get package_groups_update_url
    assert_response :success
  end

  test "should get destroy" do
    get package_groups_destroy_url
    assert_response :success
  end

end
