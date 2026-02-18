class RewardsController < ApplicationController
  def show
    @points = current_user.reward_points
    @next_reward_at = 500
    @progress = [(@points.to_f / @next_reward_at * 100).round, 100].min
    @activities = current_user.reward_activities.recent.limit(10)
  end
end
