class TaskController < ApplicationController

  def index
    tasks = Task.all
  end

  def create
    task = Task.create(task_params)
  end

  def update
    task = Task.update(task_params)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
  end

  def show
    task = Task.find(params[:id])
  end

  private
  def task_params
    params[:task_info].permit(:title, :duedate)
  end
end
