class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ profile_attributes: [:dob, :address, :user_id]])
  end
end

def check_current_user
    if current_user.profile.nil?
      redirect_to root_path
  end
end
