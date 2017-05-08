module VotesHelper

  def current_vote(post)
    if current_user
      @vote ||= Vote.find_by(author: current_user, post: post)
    else
      @vote ||= Vote.last
    end
  end
end
