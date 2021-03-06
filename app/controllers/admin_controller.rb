class AdminController < ApplicationController
  before_action :is_admin

  def index
    @guests = Guest.where(guest_id: nil).order(:will_attend)
    @messages = Message.all
    @attending_count = Guest.where.not(will_attend: 'not attending').count
  end

  private

  def is_admin
    @current_user = current_user
    if !@current_user || !@current_user.is_admin
      redirect_to root_path
    end
  end

end
