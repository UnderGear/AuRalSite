require 'test_helper'

class GroupLocationsControllerTest < ActionController::TestCase
  setup do
    @group_location = group_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_location" do
    assert_difference('GroupLocation.count') do
      post :create, :group_location => @group_location.attributes
    end

    assert_redirected_to group_location_path(assigns(:group_location))
  end

  test "should show group_location" do
    get :show, :id => @group_location.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @group_location.to_param
    assert_response :success
  end

  test "should update group_location" do
    put :update, :id => @group_location.to_param, :group_location => @group_location.attributes
    assert_redirected_to group_location_path(assigns(:group_location))
  end

  test "should destroy group_location" do
    assert_difference('GroupLocation.count', -1) do
      delete :destroy, :id => @group_location.to_param
    end

    assert_redirected_to group_locations_path
  end
end
