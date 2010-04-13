require 'spec_helper'

describe SessionsController do
  integrate_views
  
  #Delete these examples and add some real ones
  it "should use SessionsController" do
    controller.should be_an_instance_of(SessionsController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get :new 
      response.should have_tag("title", /sign ip/i)
    end
  end#  describe "GET 'new'" do
  
  describe "POST 'create'" do
    
    describe "invalid signin" do
      
      before(:each) do
        @attributes = { :email => "email@example.com", :password => "password" }
        User.should_receive(:authenticate).
        with(@attributes[:email], @attributes[:password]).
        and_return(nil)
      end
      
      it "should re-render the new page" do
        post :create, :session => @attributes
        response.should render_template('new')
      end
      
      it "should have the right title" do
        post :create, :session => @attributes
        response.should have_tag("title", /sign in/i)
      end     
    end# describe "invalid signin" do
    
    describe "valid signin" do
      
      before(:each) do
        @user = Factory(:user)
        @attributes = { :email => @user.email, :password => @user.password }
        User.should_receive(:authenticate).
        with(@user.email, @user.password).
        and_return(@user)
      end
      
      it "should sign the user in" do
        post :create, :session => @attributes
        controller.current_user.should == @user
        controller.should be_signed_in
        # Fill in with tests for a signed-in user.
      end
      
      it "should redirect to the user show page" do
        post :create, :session => @attributes
        redirect_to user_path(@user)
      end
    end#describe "valid signin" do
      
  end #describe "POST 'create'" do
    
  describe "DELETE 'destroy'" do
    
    it "should sign a user out" do
      test_sign_in(Factory(:user))
      controller.should be_sign_in
      delete :destroy
      controller.should_not be_sign_in
      response.should redirect_to(root_path)
    end
  end# describe "DELETE 'destroy'" do
  
end
