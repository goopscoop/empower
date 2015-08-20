class ShareController < ApplicationController

  def show
    is_admin?
    @material = get_material_by_id params[:id]
    @current_associations = @material.users
    @non_associations = get_all_non_associated_users @current_associations
  end

  def create
    is_admin?
    User.find(params[:user_id]).materials << Material.find(params[:material_id])
    redirect_to "/users/#{current_user.id}/share/#{params[:material_id]}"
  end

  def destroy
    is_admin?
    user = User.find(params[:user_id])
    association = user.materials.find(params[:id])
    delete_association user,association

    redirect_to "/users/#{current_user.id}/share/#{params[:id]}"
  end

  private

  def get_all_non_associated_users associations
    users = []
    User.find_each do | u |
      if associations.index(u) == nil
        users.push(u)
      end
    end
    users
  end

end
