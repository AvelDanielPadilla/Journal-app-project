class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:id)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @users = User.order(:id)
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
    if @category.update(user_params)
      flash.notic = "Category has ben successfully updated"
      redirec_to users_path
    else
      reder :edit
    end
  end

  def delete
    @category
  end

  private
  def category_params
    params.require(:category).permit(:note, :description, :number)
  end
end
