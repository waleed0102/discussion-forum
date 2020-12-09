class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  skip_before_action :verify_authenticity_token

  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def expert_authenticate
    authorize current_user, :expert?
  end

  private

  def user_not_authorized(exception)
    "User not authorized"
  end
end
