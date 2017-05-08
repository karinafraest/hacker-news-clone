class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if helpers.current_user
      @post = Post.new(post_params)
      @post.author = helpers.current_user
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
    else
      redirect_to new_session_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :author_id)
  end

end
