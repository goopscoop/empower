class MaterialsController < ApplicationController

  def index
    is_admin?
    @all_materials = add_user_info get_all_materials
  end

  def show
    is_authenticated?
    @material = get_material_by_id params[:id]
    @current_user = current_user
  end

  def new
    is_admin?
    @new_material = Material.new
  end

  def create
    is_admin?
    created_material = Material.create( material_params )
    redirect_to material_path created_material[:id]
  end

  def edit
    is_admin?
    @material = Material.find( params[:id] )
  end

  def update
    is_admin?
    Material.find( params[:id] ).update( material_params )
    redirect_to material_path params[:id]
  end

  def destroy
    is_admin
    Material.delete( params[:id] )
    flash[:success] = "Material was successfully deleted."
    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:title, :body, :kind)
  end

  def get_all_materials
    Material.all
  end

  def add_user_info materials
    material_info = []
    materials.each do |m|
      users = []
      m.users.each do |u|
        users.push({id: u[:id], name: u[:name] + u[:lastname] })
      end
      material_info.push({material: m, users: users })
    end
    material_info
  end

end
