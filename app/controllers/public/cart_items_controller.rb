class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end


  def update
  end

  def delete
  end

  def destroy
  end

  def create
    @cart_item = CartItem.new

  end

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    product.with_tax_price * amount
  end

end
