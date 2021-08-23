class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    byebug
    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :index
    end    
  end

  private
  def user_params
    params.permit(:email, :password)
  end
  
end
