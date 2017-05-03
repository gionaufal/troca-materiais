class UsersController < ApplicationController
  before_action :set_user

  def show
    @user = UserPresenter.new(@user, current_user)
    @wishes = @user.wishes
    @materials = @user.materials
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
