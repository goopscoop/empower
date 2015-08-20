class UserAdminController < ApplicationController

  def index
    is_admin?
    @all_users = User.all
  end

end
