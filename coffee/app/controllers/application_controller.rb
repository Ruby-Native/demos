class ApplicationController < ActionController::Base
  include Authentication

  before_action :authenticate_user!
  around_action :set_time_zone

  allow_browser versions: :modern

  helper_method :current_cart, :cart_count

  private

  def set_time_zone(&block)
    Time.use_zone(cookies[:timezone] || "UTC", &block)
  end

  def current_cart
    @current_cart ||= current_user&.orders&.find_by(status: :cart) || current_user&.orders&.create!(status: :cart)
  end

  def cart_count
    current_cart&.order_items&.sum(:quantity) || 0
  end
end
