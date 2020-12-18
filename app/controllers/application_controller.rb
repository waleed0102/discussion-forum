class ApplicationController < ActionController::Base
  include Pundit
  skip_before_action :verify_authenticity_token

  before_action :update_allowed_parameters, if: :devise_controller?

  protected
  
  def expert_authenticate
    authorize current_user, :expert?
  end

  def after_sign_in_path_for(resource_or_scope)
    campaigns_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :status, :type, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
  end

  private

  def user_not_authorized(exception)
    "User not authorized"
  end
end
