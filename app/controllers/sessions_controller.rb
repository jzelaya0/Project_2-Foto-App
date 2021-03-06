class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to photos_path, notice: "logged in!"
    else
      flash.now.alert = "Invalid Login Credentials"
      render 'new'
    end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "logged out"
  end
end
