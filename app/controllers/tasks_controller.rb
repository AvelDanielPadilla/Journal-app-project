class TasksController < ApplicationController
  def index
    if params[:category_id]
      @tasks = Task.where(category_id: params[:category_id])
    else
      @tasks = Task.order(:id)
    end
  end

  def show
    @task  = Task.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id]) if params[:category_id]
    @task  = Task.new
  end

  def create
    # @task = Task.new(task_params)
    # @categories = Category.order(:id)
    # @task = Task.first
    # @task = @category.tasks.build(task_params)
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new(task_params)
    if @task.save
      flash.notice = "New Task added"
      redirect_to category_path(@category)
    else
      puts @task.errors.full_messages
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
