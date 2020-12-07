class SessionsController < ApplicationController

    def login
      @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = "Invalid email or password"
          redirect_to login_path
        end
      end
  
    def login_post
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_back fallback_location: login_path
      end
    end
  
    def logout
      session.destroy
      redirect_to login_path
    end
  
    def google_login
        username = request.env['omniauth.auth']['info']['name']
        user_email = request.env['omniauth.auth']['info']['email']
        @user = User.find_or_create_by(username: username) do |user|
            user.email = user_email
            user.password = SecureRandom.hex
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
  end