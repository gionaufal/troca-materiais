class UserPresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  attr_reader :user

  def initialize(user)
    @user = user
    __setobj__(user)
    set_view_paths
  end

  def wish_title
    if user == current_user
      'Meus desejos'
    else
      'Materiais que deseja receber'
    end
  end

  def material_title
    (user == current_user) ? 'Meus materiais' : 'Materiais que deseja trocar'
  end

  private
  def helpers
    ApplicationController.helpers
  end

  def set_view_paths
    view_paths = Rails::Application::Configuration
      .new(Rails.root).paths['app/views']
    helpers.view_paths = view_paths
  end
end
