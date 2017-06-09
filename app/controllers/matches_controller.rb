class MatchesController < ApplicationController
  def new
    @match = Match.new
    @materials = current_user.materials
    @wishes = User.find(params[:id]).materials
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:notice] = 'Proposta enviada com sucesso'
      redirect_to Wish.find(@match.wish).user
    else
      flash[:error] = 'Não foi possível enviar a proposta'
      render :new
    end
  end

  private

  def match_params
    params.require(:match).permit(:material, :wish)
  end
end
