class PicturesController < ApplicationController
  before_filter :authorize, only: [:create, :destroy]
  def index
    if current_user == nil
      redirect_to root_url, notice: "Please sign in"
    else
      render 'index'
    end
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: "Upload Successful!"
    else
      render 'new'
    end
  end

  def new
    @picture = Picture.new
  end

  def show
    @tag = Tag.new
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.delete
    redirect_to("/pictures")
  end

private

  def picture_params
    params.require(:picture).permit(:photo, :caption, :user_id)
  end
end
