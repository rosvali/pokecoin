require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user1)
  end

  teardown do
    Rails.cache.clear
  end

  test "sign up failed without name" do
    post user_registration_url, params: { user: { email: "test@mail.com", password: "password"}}
    assert :unauthorized
  end

  test "user sign up with name" do
    post user_registration_url, params: { user: { name: "Titi", email: "test1@mail.com", password: "password"}}

    assert :success
  end
  
  test "user can't access show if not logged" do
    get user_url(@user.id)
    assert_response :redirect
  end
  
  test "user can't access update if not logged" do
    put user_url(@user.id)
    assert_response :redirect
  end

  test "user can add balance" do
    sign_in @user
    initial_balance = @user.balance
    put user_url(@user.id)
    @user.reload

    assert_equal initial_balance + 50, @user.balance
  end

  test "user can access show" do
    sign_in @user
    get user_url(@user.id)
  end
end
