class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.create(friend_request_params)
    flash[:notice] = "Friend request sent!"
    redirect_to users_path
  end

  private

  def friend_request_params
    params.permit(:sender_id, :receiver_id)
  end
end
