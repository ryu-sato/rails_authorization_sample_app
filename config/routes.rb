Rails.application.routes.draw do
  root to: 'books#index'

  resources :books
  resources :authors

  devise_for :users
end
