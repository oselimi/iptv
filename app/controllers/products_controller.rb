class ProductsController < ApplicationController
  before_action :set_params, only: [ :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :require_same_user, only:[:edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show
    @products = Product.all
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = User.first
    if @product.save
      flash[:success] = "IPTV uploaded successsfully"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:info] = "You link successfully updated"
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      flash[:danger] = "IPTV successfully deleted"
      redirect_to products_path
    end
  end

  def blog
  end

  private

  def product_params
    params.require(:product).permit(:title, :link)
  end

  def set_params
    @product = Product.find(params[:id])
  end

  def require_same_user
    if current_user != @product.user && !current_user.admin?
      flash[:danger] = "You can only whatch iptv"
      redirect_to product_path
    end
  end
end
