class Admin::CategoriesController < ApplicationController
  before_action :basic
  def basic
    authenticate_or_request_with_http_basic do |id, password|
      id == ENV['BASIC_AUTH_ID'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categories created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end