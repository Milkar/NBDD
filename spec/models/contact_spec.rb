require 'spec_helper'

describe Contact do
  before(:each) do
    @valid_attributes = {
      :companyName => "value for companyName"
    }
  end

  it "should create a new instance given valid attributes" do
    Contact.create!(@valid_attributes)
  end
  
  it "should require a name for the company" do
    no_name_contact = Contact.new(@valid_attributes.merge(:companyName => ""))
    no_name_contact.should_not be_valid
  end
  
  it "should reject duplicate company name" do
    Contact.create!(@valid_attributes)
    contact_duplicate = Contact.new(@valid_attributes)
    contact_duplicate.should_not be_valid
  end
  
end
