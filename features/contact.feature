Feature: add contact before create a project for that
   In order to add a contact
   as a member
   Need to fill up some information about contact
  
  	Scenario: add contact button should be displayed when no contact yet
  	Given I am signed in as a member without contact 
   	Then I should see "There is no contact."
   	When I follow "add contact"
    Then I should see "new contact form"
    When I fill in the following:
    	|company	|Softloop			|
    	|address	|Frankfurt am Main	|
    	|tel		|06923456			|
   	Then I should see "Successful"
  
