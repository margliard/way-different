Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:show, :index] do
    resources :review_experiences, only: [ :new, :create, :destroy ]
    resources :favorites, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :travelboards do
    resources :review_travelboards, only: [ :new, :create ]
  end
  resources :travelboards
  resources :favorites, only: [:destroy]
end
