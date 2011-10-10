require 'test_helper'

class LocationsetsControllerTest < ActionController::TestCase
  setup do
    @locationset = locationsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locationsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locationset" do
    assert_difference('Locationset.count') do
      post :create, :locationset => @locationset.attributes
    end

    assert_redirected_to locationset_path(assigns(:locationset))
  end

  test "should show locationset" do
    get :show, :id => @locationset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @locationset.to_param
    assert_response :success
  end

  test "should update locationset" do
    put :update, :id => @locationset.to_param, :locationset => @locationset.attributes
    assert_redirected_to locationset_path(assigns(:locationset))
  end

  test "should destroy locationset" do
    assert_difference('Locationset.count', -1) do
      delete :destroy, :id => @locationset.to_param
    end

    assert_redirected_to locationsets_path
  end
end
