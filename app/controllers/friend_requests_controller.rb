class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.create(friend_request_params)
    flash[:success] = "Friend request sent!"
    redirect_to users_path
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.delete
    redirect_back(fallback_location: root_path)
  end

  private

  def friend_request_params
    params.permit(:sender_id, :receiver_id)
  end
end
