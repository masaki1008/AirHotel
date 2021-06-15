Rails.application.routes.draw do
  get 'rooms/index'
  root 'pages#home'
  
  devise_for :users, controllers: { registrations: 'registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show]
  
  resources :rooms
  
  resources :reservations
end
