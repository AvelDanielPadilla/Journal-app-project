class TasksController < ApplicationController
  before_action :set_category, only: [ :index, :new, :create ]
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = @category.tasks
  end

  def show
  end

  def new
    @task = @category.tasks.new
  end

  def create
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

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to category_path(@task.category)
    else
      render :edit
    end
  end

  def destroy
    category = @task.category
    @task.destroy
    redirect_to category_path(category), notice: "Task was successfully deleted."
  end

  private

  def set_category
    @category = Current.user.categories.find(params[:category_id])
  end

  def set_task
    @task = Task.find(params[:id])
    # Ensure the task belongs to a category owned by the current user
    unless Current.user.categories.include?(@task.category)
      redirect_to root_path, alert: "You are not authorized to access this task."
    end
  end

  def task_params
    params.require(:task).permit(:taskname, :details, :duedate)
  end
end







