require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do 
    user = User.create(name: "user1", email: "user1@mail.com", 
      password: "123456")
    assert user.valid?
  end

  test "invalid user: name missing" do
    user = User.create(email: "user2@mail.com", password: "123456")
    refute user.valid?
  end
end
