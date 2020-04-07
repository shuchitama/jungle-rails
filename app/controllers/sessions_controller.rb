class SessionsController < ApplicationController
  
  def new
  end

  def create
    puts params
    puts user_params
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
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
    params.require(:login).permit(:email, :password)
  end

end