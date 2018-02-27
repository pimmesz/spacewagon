Rails.application.routes.draw do
  # get 'spaceships/index'

  # get 'spaceships/new'

  # get 'spaceships/show'

  devise_for :users

  root to: 'spaceships#index'
  resources :spaceships do
    resources :bookings
  end
  get '/dashboard', to: "users#dashboard", as: :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
