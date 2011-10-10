require 'test_helper'

class LocationsLocationsetsControllerTest < ActionController::TestCase
  setup do
    @locations_locationset = locations_locationsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations_locationsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locations_locationset" do
    assert_difference('LocationsLocationset.count') do
      post :create, :locations_locationset => @locations_locationset.attributes
    end

    assert_redirected_to locations_locationset_path(assigns(:locations_locationset))
  end

  test "should show locations_locationset" do
    get :show, :id => @locations_locationset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @locations_locationset.to_param
    assert_response :success
  end

  test "should update locations_locationset" do
    put :update, :id => @locations_locationset.to_param, :locations_locationset => @locations_locationset.attributes
    assert_redirected_to locations_locationset_path(assigns(:locations_locationset))
  end

  test "should destroy locations_locationset" do
    assert_difference('LocationsLocationset.count', -1) do
      delete :destroy, :id => @locations_locationset.to_param
    end

    assert_redirected_to locations_locationsets_path
  end
end
