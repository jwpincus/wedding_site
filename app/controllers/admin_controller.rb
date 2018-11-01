class AdminController < ApplicationController
  before_action :is_admin
  
  def index
    @guests = Guest.all
  end
  
  private
  
  def is_admin
    @current_user = current_user
    if !@current_user || !@current_user.is_admin
      redirect_to root_path
    end
  end
  
end