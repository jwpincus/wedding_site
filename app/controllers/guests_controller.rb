class GuestsController < ApplicationController

  def edit
    @guest = Guest.find_by_email(params[:email]) || Guest.new
  end

  def update
    Guest.update(guest_params)
    flash[:success] = 'Your information was saved, thanks for updating us!'
  end


  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email, :will_attend, :will_camp, :dietary_restrictions, :song, plus_ones_attributes: [:id, :first_name, :last_name, :email, :will_attend, :will_camp, :dietary_restrictions, :song])
  end

end
