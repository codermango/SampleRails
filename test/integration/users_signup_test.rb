require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {
        name: "",
        email: "mark@dddd",
        password: "fff",
        password_confirmation: "mark"
      }
    end
    assert_template 'new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {
        name: "user1",
        email: "user1@qq.com",
        password: "111111",
        password_confirmation: "111111"
      }
    end
    assert_template 'show'
  end

end
