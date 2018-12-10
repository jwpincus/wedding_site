class GuestsController < ApplicationController

  def edit
    @guest = Guest.find_by_email(params[:email])
    if !@guest
      flash[:success] = "There was some trouble finding your RSVP, get in touch with Jack or Cayley"
      redirect_to root_path
    end
    @guest = @guest.primary_guest if @guest.primary_guest != nil
  end

  def update
    guest = Guest.find_by_email(params[:guest][:email])
    if guest && guest.update(guest_params)
      flash[:success] = 'Your information was saved, thanks for updating us!'
      redirect_to root_path
    else
      flash[:success] = "There was some trouble saving your info, make sure that name and email fields are filled out."
      redirect_back(fallback_location: root_path)
    end
  end


  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email, :will_attend, :will_camp, :dietary_restrictions, :song, plus_ones_attributes: [:id, :first_name, :last_name, :email, :will_attend, :will_camp, :dietary_restrictions, :song])
  end

end
