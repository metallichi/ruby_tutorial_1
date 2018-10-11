class TasksController < ApplicationController
  def index
    @tasks = Task.all.order('completion_date DESC, description')
  end

  def show
    id = params[:id]
    @task = Task.find_by(id: id)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path

  end

  def new
    @task = Task.new
  end

  def edit
    id = params[:id]
    @task = Task.find_by(id: id)
  end

  def update
    id = params[:id]
    @task = Task.find_by(id: id)
    @task.update(task_params)
    redirect_to task_path

  end

  def destroy
    id = params[:id]
    task = Task.find_by(id: id)
    Task.delete(task)
    redirect_to root_path
  end

  private
    def task_params
      return params.require(:task).permit(:name, :description, :completion_date)
    end

end
