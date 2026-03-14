class ProfilesController < ApplicationController
  def show
    @stamp_count = current_user.stamps.count
    @favorite_count = current_user.favorites.count
  end

  def destroy
    current_user.destroy
    sign_out current_user
    redirect_to root_path
  end
end
