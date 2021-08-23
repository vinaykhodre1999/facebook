class ProfilesController < ApplicationController

	def show
		@profile = current_user.profile
	end

	def new
		if current_user.profile
			redirect_to posts_path
		else
			@profile = Profile.new
  	end
	end

	def create
   @profile = Profile.new(profile_params.merge(user_id: current_user.id))
   @profile.image.attach(params[:profile][:image])

    if @profile.save
    	redirect_to posts_path
		else
			render "new"
		end
	end

	def edit
    @profile = Profile.find(params[:id])
  end

  def update
  	@profile = Profile.find(params[:id])
    if @profile.update(profile_params)
     redirect_to root_path
    else
      render :edit
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:dob, :address, :image, users_attributes: [:email]) 
    end
end
