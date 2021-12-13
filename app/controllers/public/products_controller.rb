class Public::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
     @product = Product.find(params[:id])
     @cart_item = CartItem.new
  end

end



private
  def product_params
    params.require(:product).permit(:title, :body, :price, :image)
  end