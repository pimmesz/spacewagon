Rails.application.routes.draw do
  # get 'spaceships/index'

  # get 'spaceships/new'

  # get 'spaceships/show'

  devise_for :users
  root to: 'pages#home'
  resources :spaceships
  get '/dashboard', to: "users#dashboard", as: :dashboard
  resources :bookings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
