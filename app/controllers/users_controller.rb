class UsersController < ApplicationController
    before_action :find_user, only: [:show]

    def new
      @user = User.new
    end

    def show
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
      end


    private
    def find_user
        @user = User.find_by_id(session[:user_id])
        redirect_to login_path if !@user
      end
    
      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
end
