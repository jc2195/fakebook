class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    unless Profile.exists?(user_id: @user.id)
      Profile.create(user_id: @user.id)
      UserMailer.with(user: @user).welcome_email.deliver_now
    end
    sign_in_and_redirect @user
  end
end