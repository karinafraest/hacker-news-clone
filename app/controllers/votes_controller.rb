class VotesController < ApplicationController
  def create
    if helpers.current_user
      @post = Post.find(params[:post_id])
      @vote = Vote.find_or_create_by(value: 1,author: helpers.current_user, post: @post)
      @post.save
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if helpers.current_user
      @vote = Vote.find_by(post: @post, author: helpers.current_user)
      if @vote.valid?
        @vote.destroy
      end
    end
      redirect_to posts_path
  end
end
