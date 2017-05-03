class UserPresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  attr_reader :user, :current_user

  def initialize(user, current_user)
    @user = user
    @current_user = current_user
    __setobj__(user)
    set_view_paths
  end

  def wish_title
    current_user? ? 'Meus desejos' : 'Materiais que deseja receber'
  end

  def material_title
    current_user? ? 'Meus materiais' : 'Materiais que deseja trocar'
  end

  private
  def current_user?
    user == current_user
  end

  def helpers
    ApplicationController.helpers
  end

  def set_view_paths
    view_paths = Rails::Application::Configuration
      .new(Rails.root).paths['app/views']
    helpers.view_paths = view_paths
  end
end
