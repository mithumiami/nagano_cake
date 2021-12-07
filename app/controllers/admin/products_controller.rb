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
     @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(user_params)
      flash[:notice] = "User info was successfully updated."
      redirect_to admin_products_path(@product.id)
    else
      render :edit
    end

  end


end

 private
  def product_params
    params.permit(:title)
  end