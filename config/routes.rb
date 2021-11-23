Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:show, :index] do
    resources :review_experiences, only: [ :new, :create ]
    resources :favorites, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :travelboards
  resources :favorites, only: [:destroy]
end
