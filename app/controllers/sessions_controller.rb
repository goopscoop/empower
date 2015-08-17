class SessionsController < ApplicationController

  def create
    @user = User.authenticate(params[:user][:email],params[:user][:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Login Successful"
      redirect_to user_path session[:user_id]
    else
      flash[:danger] = "Credentials Invalid"
      redirect_to root_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You are now logged out. Come back soon."
    redirect_to root_path
  end

  private

end
