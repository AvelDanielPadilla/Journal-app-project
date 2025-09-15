class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:id)
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end

  def new
    @category = Category.new
  end

  def create
    @user = User.where(signed_in: true).first
    @category = @user.categories.build(category_params)
    #puts category_params.inspect
    #puts @category.inspect
    #puts @category.valid?
    if @category.save
      flash.notice = "New category has been added"
      redirect_to users_path
    else
      flash.alert = "Category was not saved"
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash.notice = "Category has been successfully updated"
      redirect_to users_path
    else
      reder :edit
    end
  end

  def delete
    @category = Category.find(params[:id])
    @category.delete
    redirect_to users_path
  end

  def create_category
    @category = Category.where(note: params[:category][:note], description: params[:category][:description], number: params[:category][:number]).first

    if @category
      @category.update(create_category: true)
      flash.notice = "New Category created"
      redirect_to users_path
    else
      flash.alert = "Category not saved"
      redirect_to users_path
    end
  end
  private
  def category_params
    params.require(:category).permit(:note, :description, :number)
  end
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
