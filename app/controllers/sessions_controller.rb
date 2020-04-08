class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    puts "Testing"
    p params
    if user = User.authenticate_with_credentials(user_params[:email], user_params[:password])
      p user
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private 
  def user_params
    params.require(:session).permit(:email, :password)
  end

end