class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.author = helpers.current_user
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :description, :article)
  end
end
