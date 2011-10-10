require 'test_helper'

class UserparamsControllerTest < ActionController::TestCase
  setup do
    @userparam = userparams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userparams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userparam" do
    assert_difference('Userparam.count') do
      post :create, :userparam => @userparam.attributes
    end

    assert_redirected_to userparam_path(assigns(:userparam))
  end

  test "should show userparam" do
    get :show, :id => @userparam.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @userparam.to_param
    assert_response :success
  end

  test "should update userparam" do
    put :update, :id => @userparam.to_param, :userparam => @userparam.attributes
    assert_redirected_to userparam_path(assigns(:userparam))
  end

  test "should destroy userparam" do
    assert_difference('Userparam.count', -1) do
      delete :destroy, :id => @userparam.to_param
    end

    assert_redirected_to userparams_path
  end
end
