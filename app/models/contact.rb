class Contact < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible(:company)
  
#  validates_presence_of(:company)
#  validates_uniqueness_of(:company)
end
