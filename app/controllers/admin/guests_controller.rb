require 'csv'

class Admin::GuestsController < AdminController
  before_action :is_admin
  
  def new
    
  end
  
  def create
    CSV.foreach(guest_params.path) do |row|
      guest = Guest.find_or_create_by(name: row[0].titleize, email: row[2])
      if !row[2].blank?
        guest.plus_ones << PlusOne.create(name: row[3].titleize, email: row[4])
      end
    end
    
    redirect_to dashboard_path
  end
  
  private
  
  def guest_params
    params.require(:guests_csv)
  end
  
end