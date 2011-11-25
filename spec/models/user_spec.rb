require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
        :name => "User Example",
        :email => "user@example.com",
        :password => "foobar",
        :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given valid attribute" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |add|
      valid_email_user =  User.new(@attr.merge(:email => add))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo]
    addresses.each do |add|
      invalid_email_user = User.new(@attr.merge(:email => add))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email address identical up to case" do
    User.create!(@attr)
    upcased_email = @attr[:email].upcase
    upcased_email_user = User.new(@attr.merge(:email => upcased_email))
    upcased_email_user.should_not be_valid
  end

  describe "passwords" do
    before(:each) do
      @user = User.new(@attr)
    end
    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do
    it "should require password" do
      invalid_password_user = User.new(@attr.merge(:password => "", :password_confirmation => ""))
      invalid_password_user.should_not be_valid
    end

    it "should require a matching password confirmation" do
      invalid_password_confirmation_user = User.new(@attr.merge(:password_confirmation => "invalid"))
      invalid_password_confirmation_user.should_not be_valid
    end

    it "should reject short passwords" do
      short_password = "a" * 5
      short_password_user = User.new(@attr.merge(:password => short_password, :password_confirmation => short_password))
      short_password_user.should_not be_valid
    end

    it "should reject long passwords" do
      long_password = "a" * 41
      long_password_user = User.new(@attr.merge(:password => long_password, :password_confirmation => long_password))
      long_password_user.should_not be_valid
    end
  end

  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
  end
end


# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

