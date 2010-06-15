#for Sign Up feature
When /^I should go to profile page for "([^\"]*)"$/ do |username|
  user = Factory.create(:user)
  visit user_url(user)
  response.body.should =~ Regexp.new(username)
end


Then /^I should see$/ do |table|
  table.hashes.each do |hash|  
    Then /^I should see$/ do hash      
    end
  end  
end

#for Sign In feature
