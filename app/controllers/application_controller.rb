class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.email == 'admin@example.com'
      admin_dashboard_path
    else
    	if resource.role.present?
      	root_path
      else
      	complete_profile_pages_path
      end
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:username, :role, :email, :password, :password_confirmation)}
      devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:username, :email, :password, :remember_me, :current_password)}
    end
end
