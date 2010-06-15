class Contact < ActiveRecord::Base  
  has_one :users
  
  attr_accessible(:companyName)
  
  validates_presence_of(:companyName)
  validates_uniqueness_of(:companyName)
end
