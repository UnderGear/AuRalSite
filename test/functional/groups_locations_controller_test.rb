require 'test_helper'

class GroupsLocationsControllerTest < ActionController::TestCase
  setup do
    @groups_location = groups_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groups_location" do
    assert_difference('GroupsLocation.count') do
      post :create, :groups_location => @groups_location.attributes
    end

    assert_redirected_to groups_location_path(assigns(:groups_location))
  end

  test "should show groups_location" do
    get :show, :id => @groups_location.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @groups_location.to_param
    assert_response :success
  end

  test "should update groups_location" do
    put :update, :id => @groups_location.to_param, :groups_location => @groups_location.attributes
    assert_redirected_to groups_location_path(assigns(:groups_location))
  end

  test "should destroy groups_location" do
    assert_difference('GroupsLocation.count', -1) do
      delete :destroy, :id => @groups_location.to_param
    end

    assert_redirected_to groups_locations_path
  end
end
