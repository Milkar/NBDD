require 'spec_helper'

describe ContactsController do

   #for new contact pages
  describe "GET 'new'" do
    
    before(:each) do
      @user = Factory(:user)
      # Arrange for User.find(params[:id]) to find the right user.
      User.stub!(:find, @user.id).and_return(@user)
      
      @contact = Factory(:valid_contact)
      Contact.stub!(:find, @contact.id).and_return(@contact)
    end
    
    it "should be successful" do
      get 'new', :id => @contact
      response.should be_success
    end
    
    
  end 
     

  describe "GET 'delete'" do
    it "should be successful" do
      get 'delete'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end
end
