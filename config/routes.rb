Rails.application.routes.draw do
  # get 'users/index'

  # get 'users/new'

  # get 'users/show'

  devise_for :users
  root to: 'pages#home'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
