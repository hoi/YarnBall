class SessionsController < ApplicationController

  skip_before_action :verify_current_user, only: [:new, :create]

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
