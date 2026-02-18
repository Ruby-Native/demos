class CartsController < ApplicationController
  def show
    @cart = current_cart
    @cart_items = @cart.order_items.includes(:product, :order_item_extras)
  end
end
