Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :wikis
  resources :charges, only: [:new, :create]
  root to: 'welcome#index'
  post 'users/downgrade'
  get 'welcome/about'
  get 'welcome/index'
end
