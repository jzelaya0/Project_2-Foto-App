class UsersController < ApplicationController
  # before_action :authorize, only: :index

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
      @user = User.new
      if @user.save
        redirect_to users_path
      else
        render 'new'
      end
  end

  private
  def user_params
    params.require(:user).permit(:email , :password, :password_confirmation)
  end

end
