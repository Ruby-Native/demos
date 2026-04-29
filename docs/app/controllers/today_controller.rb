class TodayController < ApplicationController
  def index
    @todos = Current.user.todos.due_today.order(:due_at)
  end
end
