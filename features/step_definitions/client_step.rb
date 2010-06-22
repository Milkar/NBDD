Given /^I am signed in as a member without a client$/ do
  user = Factory.create(:user)
  visit user_url(user)  
end

