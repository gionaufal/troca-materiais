class UsersController < ApplicationController
  before_action :set_user

  def show
    @user = UserPresenter.new(@user, current_user)
    @wishes = @user.wishes
    @materials = @user.materials
    @wishes_matches = find_wishes_matches
    @materials_matches = find_materials_matches
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def find_wishes_matches
    wishes = []
    @wishes.each do |wish|
      wishes << wish.product
    end
    matches = []
    wishes.each do |wish|
      matches << Material.where(product: wish).to_a
    end
    matches.flatten
  end

  def find_materials_matches
    materials = []
    @materials.each do |material|
      materials << material.product
    end
    matches = []
    materials.each do |material|
      matches << Wish.where(product: material).to_a
    end
    matches
  end
end
