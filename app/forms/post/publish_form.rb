class Post::PublishForm < ApplicationForm
  attr_accessor :post_id
  attr_accessor :post
  attr_accessor :terms_of_service

  validates :post_id, presence: true
  validates :terms_of_service, acceptance: true

  def attributes
    { 'terms_of_service' => terms_of_service }
  end

  def save
    return unless valid?
  end
end
