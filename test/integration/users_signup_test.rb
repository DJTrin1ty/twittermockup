require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "abraham um",
                                         email: "user@invalid",
                                         password:              "foobar",
                                         password_confirmation: "barbar" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end