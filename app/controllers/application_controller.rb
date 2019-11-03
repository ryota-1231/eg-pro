class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  def after_sign_in_path_for(resource)
    curriculums_path
  end
  
  def after_sign_out_path_for(resource)
    users_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

end
