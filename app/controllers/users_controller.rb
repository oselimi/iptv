class UsersController < ApplicationController
  before_action :set_params, only:[:show, :edit, :update]
  before_action :login_same_user, only: [:index, :show, :edit, :update, :new]
  before_action :require_user, only:[:index, :show, :edit, :update, :new]
  before_action :login_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to you company"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:info] = "You profile now updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:danger] = "User now removed"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :telephone, :address, :city, :password, :password_confrimation)
  end

  def set_params
    @user = User.find(params[:id])
  end

  def login_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "Only your account"
      redirect_to user_path(current_user)
    end
  end

  def login_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin "
      redirect_to user_path(current_user)
    end
  end
end
