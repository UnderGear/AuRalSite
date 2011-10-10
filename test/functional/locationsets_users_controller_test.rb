require 'test_helper'

class LocationsetsUsersControllerTest < ActionController::TestCase
  setup do
    @locationsets_user = locationsets_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locationsets_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locationsets_user" do
    assert_difference('LocationsetsUser.count') do
      post :create, :locationsets_user => @locationsets_user.attributes
    end

    assert_redirected_to locationsets_user_path(assigns(:locationsets_user))
  end

  test "should show locationsets_user" do
    get :show, :id => @locationsets_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @locationsets_user.to_param
    assert_response :success
  end

  test "should update locationsets_user" do
    put :update, :id => @locationsets_user.to_param, :locationsets_user => @locationsets_user.attributes
    assert_redirected_to locationsets_user_path(assigns(:locationsets_user))
  end

  test "should destroy locationsets_user" do
    assert_difference('LocationsetsUser.count', -1) do
      delete :destroy, :id => @locationsets_user.to_param
    end

    assert_redirected_to locationsets_users_path
  end
end
