Rails.application.routes.draw do
  get 'lessons/index'
  get 'lessons/new'
  get 'lessons/create'
  get 'lessons/edit'
  get 'lessons/update'
  get 'lessons/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :lessons, only: [ :index, :new, :create, :edit, :update, :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
