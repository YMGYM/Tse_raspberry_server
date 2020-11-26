class TasksController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def index
    tasks = Task.all

    render json: tasks.to_json
  end

  def create
    task = Task.new(tasks_params)
    task.save
    render json: task

  end

  def show
    task = Task.find(params[:id])

    render json: task.to_json
  end

  def update
    task = Task.find(params[:id])
    task.update(tasks_params)
    task.save
    render json: task
  end

  def destroy
    task = Task.find(params[:id])

    task.destroy

    render json: Task.all
  end

  private
  def tasks_params
    params.permit([:title, :user_id, :dueDate, :id])
  end
end
