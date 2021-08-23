Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :posts do
    resource :publish_forms, only: [:new, :create], module: :posts, path: :publish
  end

  root to: redirect("/posts")

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq) && defined?(Sidekiq::Web)
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
