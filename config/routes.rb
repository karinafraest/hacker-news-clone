Rails.application.routes.draw do
  root to: 'posts#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  resources :posts do
    resources :comments, only: [:show,:new,:create]
  end
end
