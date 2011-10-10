require 'test_helper'

class SynthinstancesControllerTest < ActionController::TestCase
  setup do
    @synthinstance = synthinstances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synthinstances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synthinstance" do
    assert_difference('Synthinstance.count') do
      post :create, :synthinstance => @synthinstance.attributes
    end

    assert_redirected_to synthinstance_path(assigns(:synthinstance))
  end

  test "should show synthinstance" do
    get :show, :id => @synthinstance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @synthinstance.to_param
    assert_response :success
  end

  test "should update synthinstance" do
    put :update, :id => @synthinstance.to_param, :synthinstance => @synthinstance.attributes
    assert_redirected_to synthinstance_path(assigns(:synthinstance))
  end

  test "should destroy synthinstance" do
    assert_difference('Synthinstance.count', -1) do
      delete :destroy, :id => @synthinstance.to_param
    end

    assert_redirected_to synthinstances_path
  end
end
