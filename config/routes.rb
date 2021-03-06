Rails.application.routes.draw do
  root to: 'posts#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :comments, except: [:destroy, :index]
    resources :votes, only: [:create, :destroy]
  end
end
