Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [ :show, :edit, :update ]
  resources :camps do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :delete, :show]
end
