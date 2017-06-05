class UsersController < ApplicationController
  before_action :set_user

  def show
    @user = UserPresenter.new(@user, current_user)
    @wishes = @user.wishes
    @materials = @user.materials
    @wishes_matches = find_wishes_matches
    @materials_matches = find_materials_matches
    # @matches = find_matches
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # def find_matches
  #   wishes = @wishes.map(&:product)
  #   materials = @materials.map(&:product)
  #   User.where('materials IN (?)', find_materials_matches).where('wishes IN (?)', find_wishes_matches)
  # end

  def find_wishes_matches
    wishes = @wishes.map(&:product)
    matches = wishes.map { |wish| Material.where(product: wish).to_a }
    matches.flatten
  end

  def find_materials_matches
    materials = @materials.map(&:product)
    matches = materials.map { |material| Wish.where(product: material).to_a }
    matches.flatten
  end
end
