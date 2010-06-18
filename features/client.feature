Feature: add contact before create a project for that
   In order to add a contact
   as a member
   Need to fill up some information about contact
  
  	Scenario: add contact button should be displayed when no contact yet
  	Given I am signed in as a member without contact 
   	Then I should see "There is no client."
   	When I follow "add client"
    Then I should see "New client"
    When I fill in the following:
    	|company	|Softloop			|
    	|address	|Frankfurt am Main	|
    	|tel		|06923456			|
    And I press "Create"
   	Then I should see "Client was successfully created."
   	
   	Scenario: add contact button should be displayed when no contact yet
  	Given I am signed in as a member with contact 
   	Then I should see "There is no client."
   	When I follow "add client"
    Then I should see "New client"
    When I fill in the following:
    	|company	|Softloop			|
    	|address	|Frankfurt am Main	|
    	|tel		|06923456			|
    And I press "Create"
   	Then I should see "Client was successfully created."
  
