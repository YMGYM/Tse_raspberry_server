class WorksController < ApplicationController
  before_action :set_task

  def index
    works = @task.works

    render json: works.to_json
  end

  def create
    work = @task.works.create(works_params)

    render json: work
  end

  def show
    work = @task.work.find(params[:id])

    render json: work.to_json
  end

  def update
    work = @task.works.find(params[:id])
    work.update(works_params)

    render json: work.to_json
  end

  def destroy
    work = @task.works.find(params[:id])

    work.destroy

    render json: @task.works
  end

  private
  def works_params
    params.permit([:title, :task_id, :dueDate, :finish, :id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
