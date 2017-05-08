module PostsHelper

  def time_since_posted(post)
    ((Time.now - post.created_at).floor)/3600
  end

end
