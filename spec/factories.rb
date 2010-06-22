Factory.sequence :user1 do |n|
  "user#{n}" 
end


Factory.define :user, :class => User do |u|
  u.name   "milkar"
  u.email  "milkar@gmail.com"
  u.password "testPassword"
  u.password_confirmation "testPassword"
end


