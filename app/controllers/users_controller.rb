class UsersController < ApplicationController
  def index
    @users = User.order(:id)
    @categories = Category.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.notice = "Welcome! You are now registered successfully"
      redirect_to root_path
    else
      puts @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def delete
    @user
  end

  def sign_in
    @user = User.where(username: params[:user][:username], email: params[:user][:email]).first
    
    if @user
      @user.update(signed_in: true)
      flash.notice = "Signed successfully!"
      redirect_to users_path
    else
      flash.alert = "Please register a new user"
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
