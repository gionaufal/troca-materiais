class MatchesController < ApplicationController
  def new
    @match = Match.new
    @materials = current_user.materials
    @wishes = User.find(params[:id]).materials
  end

  def create
    @match = Match.new(match_params)
    other_user = Wish.find(@match.wish).user
    if @match.save
      current_user.notify(other_user, @match)
      flash[:notice] = 'Proposta enviada com sucesso'
      redirect_to other_user
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
