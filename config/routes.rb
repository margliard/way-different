Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:show, :index] do
    resources :review_experiences, only: [ :new, :create, :destroy ]
    resources :favorites, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :travelboards do
    resources :review_travelboards, only: [ :new, :create, :destroy ]
  end
  resources :travelboards
  resources :favorites, only: [:destroy]

  get 'search_accommodations', to: "pages#search_accommodations"
  get 'search_activities', to: "pages#search_activities"
  get 'search_inspirations', to: "pages#search_inspirations"
end
