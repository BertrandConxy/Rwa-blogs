Rails.application.routes.draw do
  root 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # Creating a new post
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post 'users/:user_id/posts', to: 'posts#create', as: 'posts'
  # end
  # Creating a new comment
  get 'users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_comment'
  post 'users/:user_id/posts/:id', to: 'comments#create', as: 'comments'
  # end
  # Add like
  post 'users/:user_id/posts/:id/likes', to: 'likes#create', as: 'likes'
  # end
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get '/profile', to: 'application#current_user', as: 'current_user'
end
