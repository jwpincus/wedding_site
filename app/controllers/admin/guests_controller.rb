require 'csv'

class Admin::GuestsController < AdminController
  before_action :is_admin

  def new

  end

  def create
    CSV.foreach(csv_guest_params.path) do |row|
      guest = Guest.find_or_create_by(first_name: row[0].strip.titleize, last_name: row[1].strip.titleize,  email: row[2])
      if !row[3].blank?
        guest.plus_ones.create(first_name: row[3].strip.titleize, last_name: row[4].strip.titleize, email: row[5])
      end
    end
    redirect_to dashboard_path
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    guest = Guest.find(params[:id]).update_attributes(guest_params)
    flash[:alert] = 'Guest details updated'
    redirect_to dashboard_path
  end

  private

  def csv_guest_params
    params.require(:guests_csv)
  end

  def guest_params
    params.require(:guest).permit(:name, :email, plus_ones_attributes: [:id, :name, :email])
  end

end
