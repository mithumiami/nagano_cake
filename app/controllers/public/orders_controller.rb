class Public::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders

    @sum = 0
    @shipping_cost = 800
  end

  def show
    @order = Order.find(params[:id])
    @shipping_cost = 800
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
      @delivery = Delivery.find(params[:order][:address_id])
      @order.address = @delivery.address
      @order.postal_code = @delivery.postal_code
      @order.name = @delivery.name

    else

    end

    @cart_items = current_customer.cart_items
    @sum = 0
    @shipping_cost = 800
  end

  def create
  @cart_items = current_customer.cart_items
  order = Order.new(order_params)
  order.save


    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.product_id = cart_item.product_id
      order_detail.order_id = order.id
      order_detail.price = cart_item.product.price
      order_detail.amount = cart_item.amount

      order_detail.save
    end
  redirect_to thanks_path
  @cart_items.destroy_all
  end

   private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_paymant, :shipping_cost)


  end



end
