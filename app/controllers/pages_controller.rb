class PagesController < ApplicationController
  def home
    if logged_in?
      redirect_to blog_path
    else
    redirect_to login_path
    end
  end
end
