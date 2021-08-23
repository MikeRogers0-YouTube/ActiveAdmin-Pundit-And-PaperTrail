class Post < ApplicationRecord
  has_paper_trail

  validates :title, presence: true
  validates :body, presence: true

  def published?
    published_at.present?
  end
end
