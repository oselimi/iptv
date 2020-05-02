module SessionsHelper


  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
    redirect_to login_path
  end

  def require_user
    unless  logged_in?
      flash[:danger] = "You must be loggeed in?"
      redirect_to login_path
    end
  end
end
