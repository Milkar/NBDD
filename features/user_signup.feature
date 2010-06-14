Feature: regist as member
   In order to view the dashboard panel
   as a visitor
   Need to signup as member
   
   Scenario: User fill in invalid information
   	When I go to Signup 
   	And I fill in "name" with "invalid username"
   	And I fill in "password" with "psw"
   	And I fill in "Confirmation" with "psw1"
   	And I press "Sign Up"   	
   	Then I should see "error"
   	
   Scenario: User fill in valid information
   	When I go to Signup 
   	And I fill in "name" with "Milkar"
   	And I fill in "password" with "password"
   	And I fill in "Confirmation" with "password"
   	And I press "Sign Up"   
   	Then I should go to profile page for "Milkar"	
   	
   	 
 