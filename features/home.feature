Feature: register as member
   as a visitor
   I go to the homepage
   so that I can find the sign up button
   
   Scenario: Visitor go to the home page of PMS
   	When I go to the homepage   	
   	Then I should see "Home"
   	And I should see "Help"
   	And I should see "Sign up now!"
   	And I should see "About"
   	And I should see "Softloop GmbH"
   	 
 