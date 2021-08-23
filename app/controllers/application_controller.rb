class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

 
before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ profile_attributes: [:dob, :address, :user_id]])
  end
end












	# helper_method :current_user
	# def check_current_user
	#   if current_user.nil?
	# 	  redirect_to login_path
 #    end
 #  end

	# def current_user
	# 	if session[:user_id]
	# 	  User.find(session[:user_id])
	# 	end
	# end
