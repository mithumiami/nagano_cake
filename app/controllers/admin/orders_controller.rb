class Admin::OrdersController < ApplicationController

  def edit
    @customer = Customer.find(params[:id])
    @order = Order.all
    @sum = 0
    @shipping_cost = 800
  end


  def show
  end

   private
  def customer_params
    params.require(:customer).permit(:title, :body, :price, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end
