class ProductsController < ApplicationController
  layout :products_layout

  before_action :product_details, only: %i[edit update show destroy]

  def index
    @products = Product.includes(:orders).order(:id)
  end

  def show
    @orders = @product.orders.includes(:user)
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def product_details
    @product = Product.find(params[:id])
  end

  def products_layout
    current_user&.Admin? ? 'admin' : 'merchant'
  end
end
