require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "user1", email: "user1@example.com", password: "markmark", password_confirmation: "markmark")
  end

  test "should be valid" do
    assert @user.valid?, "#{@user.valid?}, #{@user.errors.full_messages}---"
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addressed = %w[user@example.com]
    valid_addressed.each do |valid_address|
      assert @user.valid?, "#{valid_address.inspect} should be valid| #{@user.errors.full_messages}"
    end
  end

  test "email addressed should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end




























