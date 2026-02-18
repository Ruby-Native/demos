class ProductsController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end
end
