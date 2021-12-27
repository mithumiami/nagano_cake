class Admin::OrdersController < ApplicationController

  def edit
    @order = Order.find(params[:id])
    @shipping_cost = 800

  end


  def show
  end

   private
   def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :shipping_cost)
   end



  def customer_params
    params.require(:customer).permit(:title, :body, :price, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end
