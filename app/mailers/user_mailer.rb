class UserMailer < ApplicationMailer
  default from: 'donotreply@fakebook.com'
 
  def welcome_email
    @user = params[:user]
    @url  = 'https://whispering-mesa-77843.herokuapp.com/sign_in'
    mail(to: @user.email, subject: 'Welcome to Fakebook!')
  end
end
