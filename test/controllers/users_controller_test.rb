require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should route to index" do
    get users_path
    assert_response :success
  end

  test "should create user" do
    post create_user_path, params: { user: { username: "test", email: "test@example.com" } }
    assert_response :redirect
  end
end
