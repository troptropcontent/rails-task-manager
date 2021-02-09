class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end

  def create
    params[:task][:completed] = params[:task][:completed] == 1
    task_params
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)

  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  
end
