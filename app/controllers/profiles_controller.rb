class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find_by(user_id: current_user[:id])
  end

  def update
    @profile = Profile.find_by(user_id: current_user[:id])
    profile_params[:birthday] = profile_params[:birthday].to_date
    
    if @profile.update(profile_params)
      flash[:success] = "Your profile has been updated!"
      redirect_to user_path(current_user[:id])
    else
      flash[:warning] = "Oops! Something went wrong..."
      redirect_to edit_user_profile_path(current_user[:id])
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:bio, :location, :workplace, :school, :home_town, :relationship_status, :birthday, :profile_picture)
  end
end
