require 'spec_helper'

describe Client do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :company => "value for company",
      :address => "value for address",
      :tel => "(0049)-069-234"
    }
  end

  it "should create a new instance given valid attributes" do
    Client.create!(@valid_attributes)
  end
  
  it "should require a company" do
    no_company_client = Client.new(@valid_attributes.merge(:company => ""))
    no_company_client.should_not be_valid
  end
  
  it "should reject companys name that are too long" do
    long_company = "a" * 64
    long_company_client = Client.new(@valid_attributes.merge(:company => long_company))
    long_company_client.should_not be_valid
  end
  
    it "should reject companys name that are too short" do
    short_company = "a" * 3
    short_company_client = Client.new(@valid_attributes.merge(:company => short_company))
    short_company_client.should_not be_valid
  end
  
  it "should require an address " do
    no_address_client = Client.new(@valid_attributes.merge(:address => ""))
    no_address_client.should_not be_valid
  end
  
  it "should reject companys name that are too long" do
    long_address = "a" * 256
    long_address_client = Client.new(@valid_attributes.merge(:address => long_address))
    long_address_client.should_not be_valid
  end
  
  it "should require an tel " do
    no_tel_client = Client.new(@valid_attributes.merge(:tel => ""))
    no_tel_client.should_not be_valid
  end
  
   it "should require an valide format for tel " do
    not_valid_tel_client = Client.new(@valid_attributes.merge(:tel => "(0049)-069111-1"))
    not_valid_tel_client.should_not be_valid
  end
  
  
end

  
  
  