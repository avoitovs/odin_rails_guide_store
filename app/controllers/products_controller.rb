class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :update, :destroy, :edit]
  allow_unauthenticated_access only: [:show, :index]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to @product
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.expect(product: [:name, :description, :featured_image])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
