class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:notice] = "Invalid username or password"
      render 'users/login'
    end
  end

  def destroy
  	session.clear
  	redirect_to root_url, :notice => "Logged out!"
  end
end