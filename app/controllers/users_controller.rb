class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to pictures_path, notice: "Thank you for signing up!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == nil
      redirect_to root_url, notice: "Please sign in"
    else
      render 'show'
    end
  end

private
  def user_params
    params.require(:user).permit(:user_name, :name, :password, :password_confirmation)
  end
end
