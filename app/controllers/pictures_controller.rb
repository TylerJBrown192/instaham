class PicturesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @picture = @user.pictures.new(picture_params)
    if @picture.save
      flash[:notice] = "Picture added!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def new
    @user = User.find(params[:user_id])
    @picture = Picture.new
  end



  private

  def picture_params
    params.require(:picture).permit(:image)
  end
end
