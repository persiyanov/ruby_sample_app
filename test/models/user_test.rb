require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new name: 'Dmitry', email: 'persiyanov@phystech.edu',
                     password: 'foobar', password_confirmation: 'foobar'
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '      '
    assert_not @user.valid?

    @user.name = nil
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'name and email lengths' do
    @user.name = 'a' * 100
    assert_not @user.valid?

    setup
    @user.email = 'a' * 256
    assert_not @user.valid?
  end

  test 'valid email' do
    valid_emails = %w[hello@world.com user.user@mail.ru USER@foo.COM A_user-man@foo.bar.org]
    invalid_emails = %w[come,on@email.com this-email@is,not.valid and@this too soandthat.one and.the@last..one]

    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email} should be valid"
    end

    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email} should not be valid"
    end
  end

  test 'duplicate emails are not allowed' do
    @user.save
    user2 = @user.dup
    user2.email = user2.email.upcase
    assert_not user2.valid?
  end

  test 'email addresses with mixed case should be equal' do
    email = 'fOo@BaR.cOm'
    @user.email = email
    @user.save
    assert_equal email.downcase, @user.reload.email
  end

  test 'password must be present' do
    @user.password = @user.password_confirmation = nil
    assert_not @user.valid?

    @user.password = @user.password_confirmation = ' '*6
    assert_not @user.valid?

    @user.password = @user.password_confirmation = 'a'*5
    assert_not @user.valid?
  end

end
