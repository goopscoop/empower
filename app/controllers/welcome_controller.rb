class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to user_path session[:user_id]
    end
  end

end
