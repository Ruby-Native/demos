class DoneController < ApplicationController
  def index
    @todos = Current.user.todos.completed
  end
end
