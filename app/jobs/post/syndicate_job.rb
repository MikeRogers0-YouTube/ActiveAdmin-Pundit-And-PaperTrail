class Post::SyndicateJob < ApplicationJob
  queue_as :default

  def perform(post)
    post.update(syndicated_at: Time.zone.now)
  end
end
