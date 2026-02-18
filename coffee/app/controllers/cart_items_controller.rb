class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    size = params[:size] || "medium"
    milk = params[:milk]
    extras = Array(params[:extras]).reject(&:blank?)

    item = current_cart.order_items.create!(
      product: product,
      size: size,
      milk: milk,
      quantity: 1,
      unit_price: product.price_for_size(size)
    )

    extras.each do |extra_name|
      price = extra_prices[extra_name] || 0
      item.order_item_extras.create!(name: extra_name, price: price)
    end

    current_cart.recalculate_total!
    redirect_to cart_path
  end

  def update
    item = current_cart.order_items.find(params[:id])
    item.update!(quantity: params[:quantity].to_i)
    current_cart.recalculate_total!
    redirect_to cart_path
  end

  def destroy
    item = current_cart.order_items.find(params[:id])
    item.destroy!
    current_cart.recalculate_total!
    redirect_to cart_path
  end

  private

  def extra_prices
    {
      "Vanilla syrup" => 70,
      "Caramel drizzle" => 70,
      "Extra shot" => 80,
      "Whipped cream" => 50
    }
  end
end
