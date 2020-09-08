class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create 
    super
    Profile.create(user_id: current_user[:id])
    # UserMailer.with(user: current_user).welcome_email.deliver_now
  end 

  def update
    super
  end

  protected

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end