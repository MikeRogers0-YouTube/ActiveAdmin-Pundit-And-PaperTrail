class Post::PublishForm < ApplicationForm
  attr_accessor :post
  attr_accessor :terms_of_service

  validates :post, presence: true
  validates :terms_of_service, acceptance: true

  delegate :published?, to: :post

  def save
    return unless valid?

    update_post_published_at
    enqueue_syndication

    true
  end

  private

  def update_post_published_at
    post.update(published_at: Time.zone.now)
  end

  def enqueue_syndication
    Post::SyndicateJob.perform_later(post)
  end
end
