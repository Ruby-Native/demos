class ProfilesController < ApplicationController
  def show
    @stamp_count = current_user.stamps.count
    @favorite_count = current_user.favorites.count
  end
end
