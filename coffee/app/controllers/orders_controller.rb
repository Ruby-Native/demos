class OrdersController < ApplicationController
  def index
    @active_orders = current_user.orders.active.order(placed_at: :desc)
    @past_orders = current_user.orders.past.order(placed_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items.includes(:product, :order_item_extras)
  end

  def create
    cart = current_cart
    if cart.order_items.empty?
      redirect_to cart_path
      return
    end

    cart.recalculate_total!
    cart.update!(status: :placed, placed_at: Time.current)

    # Award reward points (1 point per dollar)
    points = (cart.total / 100.0).ceil
    current_user.reward_activities.create!(
      description: "Order ##{cart.id}",
      points: points
    )
    current_user.increment!(:reward_points, points)

    # Simulate order lifecycle: placed → preparing → ready → completed
    AdvanceOrderJob.set(wait: 5.seconds).perform_later(cart)

    # Reset current_cart memoization so a new cart gets created
    @current_cart = nil

    redirect_to order_path(cart)
  end
end
