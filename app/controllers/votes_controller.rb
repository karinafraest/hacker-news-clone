class VotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.votes << Vote.create(value: 1,author: helpers.current_user)
    @post.save
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    vote = @post.votes.last
    vote.destroy
    redirect_to posts_path
  end
end
