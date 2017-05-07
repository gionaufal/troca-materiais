class MaterialsController < ApplicationController
  before_action :find_material, only:[:show, :edit, :update]

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.user = current_user
    if @material.save
      redirect_to @material
    else
      flash[:alert] = 'Todos os campos são obrigatórios'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @material.update(material_params)
      redirect_to current_user
    else
      flash[:alert] = 'Todos os campos são obrigatórios'
    end
  end

  def index
    @materials = Material.all
  end

  private
  def material_params
    params.require(:material).permit(:product, :volume, :wish)
  end

  def find_material
    @material = Material.find(params[:id])
  end

end
