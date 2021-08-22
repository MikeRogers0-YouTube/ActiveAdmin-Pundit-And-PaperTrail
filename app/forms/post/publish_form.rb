class Post::PublishForm < ApplicationForm
  attr_accessor :post
  attr_accessor :terms_of_service

  validates :post, presence: true
  validates :terms_of_service, acceptance: true

  def attributes
    { 'terms_of_service' => terms_of_service }
  end
end
