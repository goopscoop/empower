class WelcomeController < ApplicationController

  def index
    if current_user
      if current_user.kind == 'admin'
        redirect_to user_admin_index_path
      elsif current_user
        redirect_to user_path session[:user_id]
      end
    end
  end

end
