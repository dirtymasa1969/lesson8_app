Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'tweets#index'
  
  devise_for :users
  resources :tweets
  resources :users

  resources :tweets do 
    resources :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
