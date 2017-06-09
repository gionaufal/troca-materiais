class MatchesController < ApplicationController
  def new
    @match = Match.new
    @materials = current_user.materials
    @wishes = User.find(params[:id]).materials
  end
end
