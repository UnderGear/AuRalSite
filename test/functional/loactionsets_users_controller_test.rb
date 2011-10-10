require 'test_helper'

class LoactionsetsUsersControllerTest < ActionController::TestCase
  setup do
    @loactionsets_user = loactionsets_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loactionsets_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loactionsets_user" do
    assert_difference('LoactionsetsUser.count') do
      post :create, :loactionsets_user => @loactionsets_user.attributes
    end

    assert_redirected_to loactionsets_user_path(assigns(:loactionsets_user))
  end

  test "should show loactionsets_user" do
    get :show, :id => @loactionsets_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @loactionsets_user.to_param
    assert_response :success
  end

  test "should update loactionsets_user" do
    put :update, :id => @loactionsets_user.to_param, :loactionsets_user => @loactionsets_user.attributes
    assert_redirected_to loactionsets_user_path(assigns(:loactionsets_user))
  end

  test "should destroy loactionsets_user" do
    assert_difference('LoactionsetsUser.count', -1) do
      delete :destroy, :id => @loactionsets_user.to_param
    end

    assert_redirected_to loactionsets_users_path
  end
end
