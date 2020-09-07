module UsersHelper
  def my_profile?(id)
    current_user.id == id
  end
end
