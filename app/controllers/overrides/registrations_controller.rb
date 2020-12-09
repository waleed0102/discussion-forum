module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_sign_up_params

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:status, :type])
    end
  end
end
