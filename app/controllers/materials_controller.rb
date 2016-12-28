class MaterialsController < ApplicationController
  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to @material
    else
      flash[:alert] = 'Todos os campos são obrigatórios'
      render :new
    end
  end

  def show
    @material = Material.find(params[:id])
  end

  private
  def material_params
    params.require(:material).permit(:product, :volume, :wish)
  end
end
