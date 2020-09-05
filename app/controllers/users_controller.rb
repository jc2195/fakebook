class UsersController < ApplicationController

    def index
    end

    def create
        @user = User.create(sign_up_params)
        redirect_to root_path
    end

end
