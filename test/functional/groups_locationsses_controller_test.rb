require 'test_helper'

class GroupsLocationssesControllerTest < ActionController::TestCase
  setup do
    @groups_locationss = groups_locationsses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups_locationsses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groups_locationss" do
    assert_difference('GroupsLocationss.count') do
      post :create, :groups_locationss => @groups_locationss.attributes
    end

    assert_redirected_to groups_locationss_path(assigns(:groups_locationss))
  end

  test "should show groups_locationss" do
    get :show, :id => @groups_locationss.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @groups_locationss.to_param
    assert_response :success
  end

  test "should update groups_locationss" do
    put :update, :id => @groups_locationss.to_param, :groups_locationss => @groups_locationss.attributes
    assert_redirected_to groups_locationss_path(assigns(:groups_locationss))
  end

  test "should destroy groups_locationss" do
    assert_difference('GroupsLocationss.count', -1) do
      delete :destroy, :id => @groups_locationss.to_param
    end

    assert_redirected_to groups_locationsses_path
  end
end
