Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :users, only: [ :show, :edit, :update ]
  resources :camps do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy, :show, :edit, :update]

  get "camp/:id", to: "pages#camp", as: :my_camp
  get "my_camps", to: "pages#my_camps", as: :my_camps
  put "camp/:id", to: "pages#confirm_booking"
end
