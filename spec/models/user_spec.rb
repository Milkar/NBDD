require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "milkar",
      :email => "milkar@gmail.com"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  it "should require a name" do
    no_name_user = User.new(@valid_attributes.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@valid_attributes.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 31
    long_name_user = User.new(@valid_attributes.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@valid_attributes.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@valid_attributes.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@valid_attributes)
    user_with_duplicate_email = User.new(@valid_attributes)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @valid_attributes[:email].upcase
    User.create!(@valid_attributes.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@valid_attributes)
    user_with_duplicate_email.should_not be_valid
  end
    


  describe "password validations" do
    it "should require a password" do
      User.new(@valid_attributes.merge(:password => "", :password_confirmation => "")).
      should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@valid_attributes.merge(:password_confirmation => "invalid")).
      should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 7
      hash = @valid_attributes.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long passwords" do
      long = "a" * 21
      hash = @valid_attributes.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end

end
