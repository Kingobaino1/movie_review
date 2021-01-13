Rails.application.routes.draw do
  resources :opinions, only:[:create, :destroy]
  devise_for :users
  root 'users#index'
  resources :users, only: [:show]
  resources :followings, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
