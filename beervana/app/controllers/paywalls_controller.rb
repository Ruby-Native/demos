class PaywallsController < ApplicationController
  def show
    redirect_to root_path and return if current_user.subscribed?
    @brewery_count = Brewery.visible.count
    @product_id = "app.beervana.pro.annual"
  end
end
