Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # Creating a new post
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post 'users/:user_id/posts', to: 'posts#create', as: 'posts'
  # end
  delete 'users/:user_id/posts/:id', to: 'posts#destroy', as: 'post' 
  # Creating a new comment
  get 'users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_comment'
  post 'users/:user_id/posts/:id', to: 'comments#create', as: 'comments'
  # end
  delete 'users/:user_id/posts/:id/comments/:comment_id', to: 'comments#destroy', as: 'comment'
  # Add like
  post 'users/:user_id/posts/:id/likes', to: 'likes#create', as: 'likes'
  # end
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  # API routes 
  namespace :api do
    namespace :v1 do
      post 'users/login' => 'users#login'
      get  'user/posts' => 'posts#list_posts'
      get  'user/post/comments' => 'posts#list_comments'
      post 'user/post/new_comment' => 'posts#add_comment'
      resources :users, only: [:index, :show]
    end
  end
end
