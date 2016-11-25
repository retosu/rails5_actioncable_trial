require 'sidekiq/web'

Rails.application.routes.draw do
  root "sessions#new"

  resources :rooms
  resources :sessions

  match "/auth/twitter/callback" => "sessions#create", via: [:get, :post]
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web, at: "/sidekiq"
end
