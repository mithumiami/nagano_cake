class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
     @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_products_path
  end

  def show

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update

  end


end

 private
  def product_params
    params.permit(:title)
  end