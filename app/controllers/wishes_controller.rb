class WishesController < ApplicationController
  before_action :find_wish, only: [:show, :edit, :update]
  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    @wish.user = current_user
    if @wish.save
      redirect_to @wish
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
    if @wish.update(wish_params)
      redirect_to current_user
    else
      flash[:alert] = 'Todos os campos são obrigatórios'
      render :new
    end
  end

  def index
    @wishes = Wish.all
  end

  private
  def wish_params
    params.require(:wish).permit(:product, :volume, :wish)
  end

  def find_wish
    @wish = Wish.find(params[:id])
  end
end
