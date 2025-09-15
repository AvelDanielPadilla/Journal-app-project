class TasksController < ApplicationController
  def index
    @tasks  = Task.order(:id)
  end

  def show
    @task  = Task.find(params[:id])
  end

  def new
    @task  = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash.notice = "New Task added"
      redirec_to category_path
    else
      flash.alert = "Task not saved"
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to category_path
    else
      render :edit
    end
  end

  def delete
    @task
  end

  private
  def task_params
    params.require(:task).permit(:taskname, :details, :duedate)
  end
end
