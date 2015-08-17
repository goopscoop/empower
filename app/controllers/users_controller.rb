class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user['id'].nil?
      flash[:danger] = "Error trying to create new login"
      redirect_to root_path
    else
      flash[:success] = "Account Creation Successful! You may log in now."
      redirect_to root_path
    end
  end

  def show
    is_authenticated?
    @user_materials = current_user.materials
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :lastname, :phone)
  end

end
