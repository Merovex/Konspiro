Rails.application.routes.draw do
  resources :organizations

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
