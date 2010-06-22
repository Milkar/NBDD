class Client < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :company, :address, :tel
  
  validates_length_of :company, :within => 4..63
  validates_length_of :address, :maximum=> 255
  #/^begin, [\(]?(\d{0,4})[\)]? for country code, [\s]?[\-]?[\s]? for space and dash
  #(\d{0,4}) for city code, (\d*) for tel number and $/ for end
  TelFormat = /^[\(]?(\d{0,4})[\)]?[\s]?[\-]?[\s]?(\d{0,4})[\s]?[\-]?[\s]?(\d*)$/;
  validates_format_of :tel, :with => TelFormat
end
