require 'test_helper'

class SynthsControllerTest < ActionController::TestCase
  setup do
    @synth = synths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synth" do
    assert_difference('Synth.count') do
      post :create, :synth => @synth.attributes
    end

    assert_redirected_to synth_path(assigns(:synth))
  end

  test "should show synth" do
    get :show, :id => @synth.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @synth.to_param
    assert_response :success
  end

  test "should update synth" do
    put :update, :id => @synth.to_param, :synth => @synth.attributes
    assert_redirected_to synth_path(assigns(:synth))
  end

  test "should destroy synth" do
    assert_difference('Synth.count', -1) do
      delete :destroy, :id => @synth.to_param
    end

    assert_redirected_to synths_path
  end
end
