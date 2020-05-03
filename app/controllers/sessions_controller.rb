class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome guest"
      log_in user
      redirect_to blog_path
    else
      flash[:danger] = "You must be logged in to watch our channels"
      render 'new'
    end
  end

  def destroy
    log_out
  end
end
