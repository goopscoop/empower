class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def is_admin?
    is_authenticated?
    unless current_user.kind == "admin"
      flash[:warning] = "Oops. You need to be an admin to visit that page."
      redirect_to user_path session[:user_id]
    end
  end

  def is_authenticated?
    unless current_user
      flash[:warning] = "Oops. You need to log in to do that."
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[ :user_id ] )
    gon.current_user = @current_user
  end

  def get_material_by_id id
    Material.find(id)
  end

  def delete_association user,association
    if association
      user.materials.delete(association)
    end
  end

end
