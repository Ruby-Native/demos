class GuestSessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.create!(
      name: "Guest",
      email: "guest#{SecureRandom.random_number(1_000_000)}@example.com",
      password: SecureRandom.hex,
      reward_points: 0
    )
    sign_in user
    redirect_to categories_path
  end
end
