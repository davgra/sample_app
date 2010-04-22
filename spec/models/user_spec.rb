# == Schema Information
# Schema version: 20100421213743
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "Example User",
      :email => "example.user@example.com"
    }
    @attr = @valid_attributes
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  it "should require a name" do
    no_name_user = User.new(@valid_attributes.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@valid_attributes.merge(:name => long_name))
    long_name_user.should_not be_valid
  end


  it "should require an email address" do
    no_name_user = User.new(@valid_attributes.merge(:email => ""))
    no_name_user.should_not be_valid
  end
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should require a unique email" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end


end
