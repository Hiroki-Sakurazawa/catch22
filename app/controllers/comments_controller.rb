class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to "/comments/#{comment.picture.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, picture_id: params[:picture_id])
  end
end
