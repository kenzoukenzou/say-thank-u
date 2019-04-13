Rails.application.routes.draw do
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  post 'logout' => 'users#logout'
  get 'signup' => 'users#new'
  resources :users
  # post 'users/:id' => 'users#update'
  # get 'users/:id/edit' => 'users#edit'
  # post 'users/create' => 'users#create'
  # get 'users/index' => 'users#index'
  # get 'users/:id' => 'users#show'
  # post "users/:id/destroy" => "users#destroy"
  
  # resources :posts
    
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post "posts/:id/destroy" => "posts#destroy"
  
  get '/' => 'home#top'
  resources :home
  root 'home#top'
end
