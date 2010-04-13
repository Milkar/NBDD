module SessionsHelper
  
  def sign_in(user)
    user.remember_me!
    cookies[:remember_token] = 
      {:value => user.remember_token,
       :expires => 1.years.from_now.utc}
    self.current_user = user   
    
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = cookies[:remember_token]
    @current_user ||= (User.find_by_remember_token(remember_token) unless remember_token.nil?)
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:rememer_token)
    self.current_user = nil
  end
end
