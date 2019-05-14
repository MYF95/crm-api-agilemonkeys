module V1
  class UsersController < ApplicationController
    before_action :authenticate_admin
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /users
    def index
      @users = User.all
      json_response(@users)
    end

    # POST /users
    def create
      @user = User.create!(user_params)
      json_response(@user)
    end

    # GET /user/:id
    def show
      json_response(@user)
    end

    # PUT/PATCH /user/:id
    def update
      @user.update!(user_params)
      json_response('User updated', 200)
    end

    # DELETE /user/:id
    def destroy
      @user.destroy!
      json_response( 'User deleted from the database', 200)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
