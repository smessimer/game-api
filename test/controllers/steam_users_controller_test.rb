require 'test_helper'

class SteamUsersControllerTest < ActionController::TestCase
  setup do
    @steam_user = steam_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steam_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create steam_user" do
    assert_difference('SteamUser.count') do
      post :create, steam_user: {  }
    end

    assert_redirected_to steam_user_path(assigns(:steam_user))
  end

  test "should show steam_user" do
    get :show, id: @steam_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @steam_user
    assert_response :success
  end

  test "should update steam_user" do
    patch :update, id: @steam_user, steam_user: {  }
    assert_redirected_to steam_user_path(assigns(:steam_user))
  end

  test "should destroy steam_user" do
    assert_difference('SteamUser.count', -1) do
      delete :destroy, id: @steam_user
    end

    assert_redirected_to steam_users_path
  end
end
