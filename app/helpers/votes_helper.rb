module VotesHelper

  def current_vote(post)
    @vote ||= Vote.find_by(author: current_user, post: post)
  end
end
