class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params
  
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer(:sign_up, keys: [:phone, :name, :avatar])
  end
end