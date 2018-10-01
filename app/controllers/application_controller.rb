class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except =>[:home, :new, :create]
  helper_method :current_user

  private

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.meta_type == 'Mover'
      mover_path(current_user.meta_id)
    elsif current_user.meta_type == 'Movee'
      movee_path(current_user.meta_id)
    end
  end
end
