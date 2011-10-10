require 'test_helper'

class AudiofilesControllerTest < ActionController::TestCase
  setup do
    @audiofile = audiofiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audiofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audiofile" do
    assert_difference('Audiofile.count') do
      post :create, :audiofile => @audiofile.attributes
    end

    assert_redirected_to audiofile_path(assigns(:audiofile))
  end

  test "should show audiofile" do
    get :show, :id => @audiofile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @audiofile.to_param
    assert_response :success
  end

  test "should update audiofile" do
    put :update, :id => @audiofile.to_param, :audiofile => @audiofile.attributes
    assert_redirected_to audiofile_path(assigns(:audiofile))
  end

  test "should destroy audiofile" do
    assert_difference('Audiofile.count', -1) do
      delete :destroy, :id => @audiofile.to_param
    end

    assert_redirected_to audiofiles_path
  end
end
