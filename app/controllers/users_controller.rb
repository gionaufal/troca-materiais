class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @wishes = @user.wishes
    @materials = @user.materials
  end
end
