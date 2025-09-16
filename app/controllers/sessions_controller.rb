class SessionsController < ApplicationController
  def new
  end

  def create
    # Find user by BOTH email and username
    user = User.find_by(email: params[:email], username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully!"
      redirect_to users_path
    else
      flash[:alert] = "Invalid email or username"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!"
    redirect_to root_path
  end
end
