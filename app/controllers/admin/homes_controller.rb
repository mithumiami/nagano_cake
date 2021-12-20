class Admin::HomesController < ApplicationController

  def top
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end


  private
  def customer_params
    params.require(:customer).permit(:title, :body, :price, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end


end

