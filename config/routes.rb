Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :shops, only: [:new, :create]
end
