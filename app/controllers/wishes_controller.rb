class WishesController < ApplicationController
  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      redirect_to @wish
    else
      flash[:alert] = 'Todos os campos são obrigatórios'
      render :new
    end
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def index
    @wishes = Wish.all
  end

  private
  def wish_params
    params.require(:wish).permit(:product, :volume, :wish)
  end
end

