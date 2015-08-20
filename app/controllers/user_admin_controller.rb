class UserAdminController < ApplicationController

  def index
    is_admin?
    @all_users = User.all
  end

  def show
    is_admin?
    @user = User.find(params[:id])
    @user_materials = @user.materials
    @all_materials = get_all_non_associated_materials @user_materials
  end

  def destroy
    is_admin?
    user = User.find(params[:id])
    association = user.materials.find(params[:material_id])
    delete_association user,association
    redirect_to user_admin_path params[:id]
  end

  def create
    is_admin?
    User.find(params[:user_id]).materials << Material.find(params[:material_id])
    redirect_to "/user_admin/#{params[:user_id]}/"
  end

  private

  def get_all_non_associated_materials associations
    materials = []
    Material.find_each do | m |
      if associations.index(m) == nil
        materials.push(m)
      end
    end
    materials
  end
end
