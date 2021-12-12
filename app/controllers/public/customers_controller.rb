class Public::CustomersController < ApplicationController

  def show
     @customer = Customer.find(current_customer.id)
  end

  def edit
     @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def check
    @customer = Customer.find(current_customer.id)
  end

  def goodbye
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

end

private
  def customer_params
    params.require(:customer).permit(:title, :body, :price, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
