class OrdersController < ApplicationController
  layout :orders_layout

  before_action :order_details, only: %i[edit update show destroy]
  before_action :product_details

  def index
    @orders = Order.includes(:product, :user).order(:id)
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :total_price, :status, :product_id, :user_id)
  end

  def order_details
    @order = Order.find(params[:id])
  end

  def product_details
    @products = Product.select(:id, :title)
  end

  def orders_layout
    current_user&.Admin? ? 'admin' : 'merchant'
  end
end
