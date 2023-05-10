class OrdersController < ApplicationController
  before_action :order_details, only: %i[edit update show destroy]

  def index
    @orders = Order.includes(:product, :user).order(:id)
  end

  def show; end

  def new
    @order = Product.find(params[:product_id]).orders.new(user_id: current_user.id)
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to products_path
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
end
