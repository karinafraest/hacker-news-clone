Rails.application.routes.draw do
  root to: 'posts#index'

  post '/users', to: 'users#create', as: :users
  get '/users/new', to: 'users#new', as: :new_user
  post '/sessions', to: 'sessions#create', as: :sessions
  get '/sessions/new', to: 'sessions#new', as: :new_session
  delete '/sessions/:id', to: 'sessions#destroy', as: :session
  
  get '/posts', to: 'posts#index', as: :posts
  post '/posts', to: 'posts#create'
  get '/posts/new', to: 'posts#new', as: :new_post
  get '/posts:id/edit', to: 'posts#edit', as: :edit_post
  get '/posts/:id', to: 'posts#show', as: :post
  patch '/posts/:id', to: 'posts#update'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

  resources :posts, only: [] do
    resources :comments, except: [:destroy, :index]
    resources :votes, only: [:create, :destroy]
  end
end
