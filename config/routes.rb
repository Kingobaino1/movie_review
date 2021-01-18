Rails.application.routes.draw do
  resources :opinions, only:[:create, :destroy, :show]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'users#index'
  resources :users, only: [:show]
  resources :followings, only: [:create, :destroy]
  resources :comments, only: [:create, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
