class ProductsController < ApplicationController

  def index
    #uses MODEL to fetch or create data
    @products = Product.all.order(created_at: :desc)
    #uses VIEW render: index is implicit no need to write it
  end

  def show
    @product = Product.find params[:id]
  end

end
