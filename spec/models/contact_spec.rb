require 'spec_helper'

describe Contact do
  before(:each) do
    @valid_attributes = {
      :company => "value for company",
      :address => "value for address",
      :tel => "value for tel"
    }
  end

  it "should create a new instance given valid attributes" do
    Contact.create!(@valid_attributes)
  end
end
