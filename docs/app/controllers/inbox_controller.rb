class InboxController < ApplicationController
  def index
    scope = Current.user.todos.pending
    @todos = case params[:sort]
    when "created"
      scope.order(created_at: :desc)
    else
      scope.order(due_at: :asc, created_at: :desc)
    end
    @sort = params[:sort] == "created" ? "created" : "due"
  end
end
