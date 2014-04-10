class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    picture = params[:tag][:picture_id]
    current_tags = Tag.where(:picture_id => picture)
    current_tags.each do |i|
      i.destroy
    end
    @tag = Tag.new(tag_params)
    params[:tag][:user_ids].each do |user_id|
      if user_id != ""
        @tag = Tag.create(:user_id => user_id, :picture_id => params[:tag][:picture_id])
      end
    end
    redirect_to picture_path(params[:tag][:picture_id])
  end

private

  def tag_params
    params.require(:tag).permit(:user_id, :picture_id)
  end
end

