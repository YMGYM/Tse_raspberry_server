class TasksController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def index
    tasks = Task.all

    render json: tasks.to_json
  end

  def create
    task = Task.create(tasks_params)

    redirect_to task
    return
  end

  def show
    task = Task.find(params[:id])

    render json: task.to_json
  end

  def update
    task = Task.find(params[:id])
    task.update(tasks_params)
    task.save

    redirect_to task
    return
  end

  def destroy
    task = Task.find(params[:id])

    task.destroy

    redirect_to '/tasks'
  end

  private
  def tasks_params
    params.permit([:title, :user_id, :duedate, :id])
  end
end
