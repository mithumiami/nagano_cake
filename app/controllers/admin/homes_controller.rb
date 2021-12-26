class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
   # @order_detail = order_detail.order


  end


   private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :shipping_cost)


  end




end

