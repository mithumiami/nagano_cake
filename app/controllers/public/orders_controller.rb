class Public::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to confirm_path(current_customer.id)
  end

  def thanks

  end

  def confirm

  end

   private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name)
  end


end
