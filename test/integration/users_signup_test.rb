require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'no user created when form is invalid' do
    get signup_path
    assert_select 'form[action="/signup"]'

    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: '',
                                          email: 'user@invalid',
                                          password: '123',
                                          password_confirmation: '321' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
  end

  test 'user created and redirected to the profile page' do
    get signup_path

    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { name: 'Example User',
                                          email: 'user@example.com',
                                          password: '123123',
                                          password_confirmation: '123123' } }
    end

    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
end
