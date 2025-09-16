require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "username must be present" do
    user = User.new(email: "avel@yahoo.com")
    assert !user.valid?, "username must have name"
  end
  test "username unique" do
    User.create(username: "Avel")
    user = User.new(username: "DingDong")
    assert !user.valid?, "user is not unique"
  end
  test "must be email format" do
    user = User.new(username: "Avel", email: "avellulu")
    assert !user.valid?, "email is not email format"
  end
end
