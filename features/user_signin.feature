Feature: regist as member
   In order to view the dashboard panel
   as a member
   Need to sign in to the profile page
    	
  Scenario: User fill in valid information to sign in
  	Given I am on  Signin
   	When I fill in the following:
      | email 		| milkar5@gmail.com	|
      | password  	| 1111qqqq    		| 
    And I press "Sign in"  
   	Then I should go to profile page for "Milkar"	
   	
   	 
 