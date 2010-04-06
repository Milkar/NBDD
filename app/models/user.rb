class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessor :password
  
  EmailFormat = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name, :email, :password
  validates_length_of :name, :maximum => 30
  validates_length_of :password, :within => 8..30
  validates_format_of :email, :with => EmailFormat
  validates_uniqueness_of :email, :case_sensitive => false
  
  validates_confirmation_of :password
end
