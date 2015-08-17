class MaterialsController < ApplicationController

  def index
    is_admin?
    @all_materials = Material.all
  end

  def show
    is_authenticated?
    @material = Material.find(params[:id])
  end

end
