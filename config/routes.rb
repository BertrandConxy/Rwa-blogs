Rails.application.routes.draw do
  root 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # Creating a new post
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post 'users/:user_id/posts/new_post', to: 'posts#create', as: 'posts'
  # end
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get '/profile', to: 'application#current_user', as: 'current_user'
end
