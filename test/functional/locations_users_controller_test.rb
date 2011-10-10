require 'test_helper'

class LocationsUsersControllerTest < ActionController::TestCase
  setup do
    @locations_user = locations_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locations_user" do
    assert_difference('LocationsUser.count') do
      post :create, :locations_user => @locations_user.attributes
    end

    assert_redirected_to locations_user_path(assigns(:locations_user))
  end

  test "should show locations_user" do
    get :show, :id => @locations_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @locations_user.to_param
    assert_response :success
  end

  test "should update locations_user" do
    put :update, :id => @locations_user.to_param, :locations_user => @locations_user.attributes
    assert_redirected_to locations_user_path(assigns(:locations_user))
  end

  test "should destroy locations_user" do
    assert_difference('LocationsUser.count', -1) do
      delete :destroy, :id => @locations_user.to_param
    end

    assert_redirected_to locations_users_path
  end
end
