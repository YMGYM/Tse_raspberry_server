class WorksController < ApplicationController
  before_action :set_task
  protect_from_forgery unless: -> { request.format.json? }
  def index
    works = @task.works

    render json: works.to_json
  end

  def create
    work = @task.works.create(works_params)
    redirect_to @task, method: :get
  end

  def show
    work = @task.work.find(params[:id])

    render json: work.to_json
  end

  def update
    work = @task.works.find(params[:id])
    work.update(works_params)
    work.save

    redirect_to @task, method: :get
  end

  def destroy
    work = @task.works.find(params[:id])

    work.destroy

    redirect_to '/tasks', method: :get
  end

  private
  def works_params
    params.permit([:title, :task_id, :dueDate, :finish, :id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
