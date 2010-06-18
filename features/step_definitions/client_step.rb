Given /^I am signed in as a member without contact$/ do
  user = Factory.create(:user)
  visit user_url(user)  
end

