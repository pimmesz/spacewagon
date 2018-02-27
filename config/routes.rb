Rails.application.routes.draw do
  get 'bookings/index'

  get 'bookings/new'

  get 'bookings/show'

  devise_for :users
  root to: 'pages#home'
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
