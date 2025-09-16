class CategoriesController < ApplicationController
  def index
    @categories = Current.user.categories
  end

  def show
    @category = Current.user.categories.find(params[:id])
    @tasks = @category.tasks
  end

  def new
    @category = Category.new
  end

  def create
    # @user = User.where(signed_in: true).first
    # @category = @user.categories.build(category_params)
    # #puts category_params.inspect
    # #puts @category.inspect
    # #puts @category.valid?
    # if @category.save
    #   flash.notice = "New category has been added"
    #   redirect_to users_path
    # else
    #   flash.alert = "Category was not saved"
    #   render :new
    # end
    @category = Current.user.categories.build(category_params)

    if @category.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @category = Current.user.categories.find(params[:id])
  end

  def update
    @category = Current.user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @category = Current.user.categories.find(params[:id])
    @category.destroy
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
    params.require(:category).permit(:user_id, :note, :description, :number)
  end
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
