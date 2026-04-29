class TodosController < ApplicationController
  before_action :set_todo, only: [ :show, :edit, :update, :destroy, :complete, :uncomplete ]

  def show
  end

  def new
    @todo = Current.user.todos.build
  end

  def create
    @todo = Current.user.todos.build(todo_params)
    if @todo.save
      redirect_to @todo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to inbox_path
  end

  def complete
    @todo.update!(completed_at: Time.current)
    redirect_back_or_to inbox_path
  end

  def uncomplete
    @todo.update!(completed_at: nil)
    redirect_back_or_to done_path
  end

  private
    def set_todo
      @todo = Current.user.todos.find(params[:id])
    end

    def todo_params
      params.expect(todo: [ :title, :description, :due_at ])
    end
end
