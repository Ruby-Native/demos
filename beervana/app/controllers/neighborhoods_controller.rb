class NeighborhoodsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @neighborhoods = Neighborhood.ordered.includes(:breweries, map_light_attachment: :blob, map_dark_attachment: :blob)
    @brewery_count = Brewery.visible.count
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @breweries = @neighborhood.breweries.ordered
  end
end
