class PassportsController < ApplicationController
  def show
    @stamps = current_user.stamps.includes(:brewery).order(stamped_at: :desc)
    @stamp_count = @stamps.size
    @brewery_count = Brewery.visible.count
  end
end
