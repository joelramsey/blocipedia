Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :wikis
  root to: 'welcome#index'
  get 'welcome/about'
  get 'welcome/index'
end
