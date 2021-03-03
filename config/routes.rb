Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lessons, only: [ :index, :new, :create, :edit, :update, :destroy ] do
    resources :bookings, only: [ :new, :create ]
  end
  
  resources :bookings, only: [ :show, :edit, :update ] do
    resources :reports, only: [ :new, :create ]
  end

  resources :reports, only: [ :show ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :my do 
    resource :dashboard, only: :show
    resource :video, only: :show
    resources :lessons, only: :index
    resources :bookings, only: :index
    resources :reports, only: :index
    resources :payments, only: :index
    resources :conversations, only: :index 
  end 
end
