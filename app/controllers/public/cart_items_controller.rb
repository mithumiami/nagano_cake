class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end


  def update
  cart_item = CartItem.find(params[:id])
  cart_item.update(cart_item_params)
  redirect_to cart_items_path
  end

  def delete
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy
    CartItem.destroy_all
    redirect_to cart_items_path
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
