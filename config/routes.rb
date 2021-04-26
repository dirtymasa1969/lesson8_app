Rails.application.routes.draw do
  get 'comment/index'
  get 'comment/new'
  get 'comment/show'
  get 'comment/edit'
  get 'comment/create'
  get 'comment/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  root 'tweets#index'
  
  devise_for :users
  resources :tweets
  resources :users

  resources :tweets do 
    resources :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
