class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end


  def update
  end

  def delete
  end

  def destroy
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end

  def with_tax_price
    (price * 1.1).floor
  end


private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id, :amount)
  end

end
