class MatchesController < ApplicationController
  def new
    @match = Match.new
    @materials = current_user.materials
    @wishes = User.find(params[:id]).materials
  end

  def create
    @match = Match.new(
      material_id: match_params[:material],
      wish_id: match_params[:wish]
    )
    other_user = Material.find(@match.wish_id).user
    if @match.save
      current_user.notify(other_user, @match)
      MatchMailer.match_email(@match).deliver_later
      flash[:notice] = 'Proposta enviada com sucesso'
      redirect_to other_user
    else
      flash[:error] = 'Não foi possível enviar a proposta'
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
    @material = Material.find(@match.material_id)
    @wish = Wish.find(@match.wish_id)
  end

  private

  def match_params
    params.require(:match).permit(:material, :wish)
  end
end
