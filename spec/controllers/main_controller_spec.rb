require 'spec_helper'

describe MainController do
  
  integrate_views
  
  #Test for Home page with the right title and sign up link
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
      
    it "should have the right title" do   
      get 'home'
      response.should have_tag("title", "NBDD app | Home")
    end
    
    it "should have the right link for sign up" do
      get 'home'
      response.should have_tag('a', 'Sign un now!')        
    end
    
    it "should have the right link for home" do
      get 'home'
      response.should have_tag('a', 'Home')        
    end
    
    it "should have the right link for help" do
      get 'home'
      response.should have_tag('a', 'Help')        
    end
    
    it "should have the right link for sign in" do
      get 'home'
      response.should have_tag('a', 'Sign in')        
    end   
  end

  
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do 
      get 'about'
      response.should have_tag("title",
                              "NBDD app | About")
    end
  end
  
  
end
