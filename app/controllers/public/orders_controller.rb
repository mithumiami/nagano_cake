class Public::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @order = Order.new
    @customer = current_customer
  end


  def thanks

  end

  def confirm
   # binding.pry
    @order = Order.new(order_params)
    if params[:order][:address_number]=="1"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name

    elsif  params[:order][:address_number]=="2"
      @delivery = Delivery.find(current_customer.id)
      @order.address = @delivery.address
      @order.postal_code = @delivery.postal_code
      @order.name = @delivery.name

    else

    end

    @cart_items = current_customer.cart_items
    @sum = 0
    @shipping_cost = 800
  end

  def update
  order = Order.find(params[:id])
  order.update(order_params)
  redirect_to thanks_path
  CartItems.destroy_all
  end

   private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method)
  end


end
