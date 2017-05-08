class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.author = helpers.current_user
    @comment.save
    redirect_to post_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :description)
  end
end
