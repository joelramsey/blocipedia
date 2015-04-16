Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'welcome#index'
  get 'welcome/about'
  get 'welcome/index'
end
