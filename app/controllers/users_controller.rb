class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end

  def new
    user = User.new

    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id

      render json: user
    else
      render json: {status: user.errors.full_messages }, status: 422
    end
  end

  def show
    user = User.find(params[:id])

    render json: user 
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: user.username
    else
      render json: {status: 500, message: 'User cannot be destroyed'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
