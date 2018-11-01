class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
    @current_user
  end

end
