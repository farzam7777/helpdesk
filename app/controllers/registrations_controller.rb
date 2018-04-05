# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
  	if resource.user_provider.present?
    	resource.update_without_password(params)
    else
    	super
    end
  end
end 