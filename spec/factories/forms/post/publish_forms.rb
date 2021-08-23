FactoryBot.define do
  factory :post_publish_form, class: Post::PublishForm do
    post { build(:post) }
    terms_of_service { "1" }
  end
end
