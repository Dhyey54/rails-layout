class ApplicationController < ActionController::Base
  layout :controller_layout
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email role])
  end

  def controller_layout
    current_user&.Admin? ? 'admin' : 'merchant'
  end
end
