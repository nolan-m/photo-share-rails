class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    params[:tag][:user_ids].each do |user|
      if user != nil
        @tag = Tag.create(:user_id => user, :picture_id => params[:tag][:picture_id])
      end
    end
    redirect_to picture_path(params[:tag][:picture_id])
  end

private

  def tag_params
    params.require(:tag).permit(:user_id, :picture_id)
  end
end

