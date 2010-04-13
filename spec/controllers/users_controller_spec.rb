require 'spec_helper'

describe UsersController do
  integrate_views

  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  #for new user pages
  describe "GET 'new'" do
    
    before(:each) do
      @user = Factory(:user)
      # Arrange for User.find(params[:id]) to find the right user.
      User.stub!(:find, @user.id).and_return(@user)
    end
    
    it "should be successful" do
      get 'new', :id => @user
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_tag("title", /Sign up/)
    end
    
    it "should include the user's name" do
      get :show, :id => @user
      response.should have_tag("h2", /#{@user.name}/)
    end
  end
  
  #for new/create user page after signup
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attributes = { :name => "", :email => "", 
                        :password => "", :password_confirmation => ""}
        @user = Factory.build(:user, @attributes)
        User.stub!(:new).and_return(@user)
      end
      
      it "should not save the user" do
        @user.should_receive(:save).and_return(false)
        post :create, :user => @attributes 
      end
      
      it "should have the right title" do
        post :creat, :user => @attributes 
        response.should render_template('new')
      end
      
      it "should render the 'new' page" do
        post :create, :user => @attributes
        response.should render_template('new')
      end    
    end#for describe failure
    
    describe "success" do
      
      before(:each) do
        @attributes = { :name => "New User", :email => "example@example.com",
                        :password => "11111111", :password_confirmation => "11111111"}        
        @user = Factory.build(:user, @attributes)
        User.stub!(:new).and_return(@user)
      end
      
      it "should save the new user" do
        @user.should_receive(:save).and_return(true)
        post :create, :user => @attributes 
      end
      
      it "should redirect to the user show page" do
        post :create, :user => @attributes 
        respond.should redirect_to(user_url(@user))
      end
      
      it "should have a welcome message" do
        post :creat, :user => @attributes 
        flash[:success].should =~ /Welcom/i   
      end
      
      it "should sign the user in" do
        post :creat, :user => @attributes 
        controller.should be_signed_in   
      end
    end
    
  end
  
end
