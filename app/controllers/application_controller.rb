class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user 

  protected
  def current_user_session 
    @current_user_session || (@current_user_session = UserSession.find) || UserSession.new  
  end
  
  def current_user 
    @current_user || @current_user = (current_user_session && current_user_session.user) 
  end
end
