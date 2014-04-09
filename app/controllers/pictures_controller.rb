class PicturesController < ApplicationController
  before_filter :authorize, only: [:create]

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

private

  def picture_params
    params.require(:picture).permit(:photo, :caption, :user_id)
  end
end
