class UsersController < ApplicationController
  before_action :require_user_logged_in!, only: [ :index ]

  def index
    @categories = Current.user.categories
    puts "Categories: #{@categories.inspect}"
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
      session[:user_id] = @user.id
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
      session[:user_id] = @user.id
      flash.notice = "Signed in successfully!"
      redirect_to users_path
    else
      flash.alert = "Invalid username or email"
      redirect_to root_path
    end
  end

  def sign_out
    # User.find(session[:user_id]).destroy 
    session[:user_id] = nil
    flash.notice = "You have been signed out."
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def require_user_logged_in!
    redirect_to root_path, alert: "You must be signed in to do that." if Current.user.nil?
  end

end
