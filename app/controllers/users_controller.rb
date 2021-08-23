class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      UserMailer.new_user(@user).deliver_now
      redirect_to login_path
    else
      render "session/index"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
