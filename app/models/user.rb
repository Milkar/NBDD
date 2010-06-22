require 'digest'

class User < ActiveRecord::Base
  
  has_many :clients
  
  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessor :password
  
  EmailFormat = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name, :email, :password
  validates_length_of :name, :maximum => 30
  validates_length_of :password, :within => 8..20
  validates_format_of :email, :with => EmailFormat
  validates_uniqueness_of :email, :case_sensitive => false
  
  validates_confirmation_of :password
   
  before_save :encrypt_password
  
  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    # Compare encrypt_password with the encrypted version of
    # submitted_password.
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
   
  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}")
    save_without_validation
  end
  
  def has_client?
    if user.clients.size != null
      true
    else
      false
    end
  end
  
  def contact_list
    contacts.map {|contact| contact.companyName}
  end
   
   
  private 
  
    def encrypt_password
      unless password.nil?
        self.salt = make_salt
        self.encrypted_password = encrypt(password)
      end
    end
    
    def encrypt(string)
      secure_hash("#{salt}#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}#{password}")
    end
  
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    
end
