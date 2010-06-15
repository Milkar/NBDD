Feature: regist as member
   In order to view the dashboard panel
   as a visitor
   Need to signup as member
   
  Scenario: User fill in invalid information
   	When I go to Signup 
   	And I fill in the following:
   	  | name    	| milkar           	| 
      | email 		| milkar@gmail.com	|
      | password  	| 1111		 		| 
      | Confirmation| q111qqqq     		| 
    And I press "Sign Up"  
   	Then I should see "Password is too short (minimum is 8 characters)"
   	
      		
  Scenario: User fill in invalid information
   	When I go to Signup 
   	And I fill in the following:
   	  | name    	| milkar           	| 
      | email 		| milkar@gmail.com	|
      | password  	| 1111qqqq    		| 
      | Confirmation| q111qqqq     		| 
    And I press "Sign Up"  
   	Then I should see "Password doesn't match confirmation"
   	
  Scenario: User fill in invalid information
   	When I go to Signup 
   	And I fill in the following:
   	  | name    	| milkar           	| 
      | email 		| @gmail.com		|
      | password  	| 1111qqqq    		| 
      | Confirmation| 1111qqqq     		| 
    And I press "Sign Up"  
   	Then I should see "Email is invalid"
 
 @valid 	
  Scenario: User fill in valid information
   	When I go to Signup 
   	And I fill in the following:
   	  | name    	| milkar           	| 
      | email 		| milkar5@gmail.com	|
      | password  	| 1111qqqq    		| 
      | Confirmation| 1111qqqq     		| 
    And I press "Sign Up"  
   	Then I should go to profile page for "Milkar"	
   	
   	 
 