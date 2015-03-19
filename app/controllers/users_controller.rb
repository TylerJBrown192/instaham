class UsersController < ApplicationController

  def new
  @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Instaham!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @pictures = Picture.find(params[:user_id])
    if @user.update(user_params)
      flash[:notice] = "Picture successfully added!"
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :avatar)
  end
end
