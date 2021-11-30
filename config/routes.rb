Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'carbon' => 'pages#carbon'
  resources :experiences, only: [:show, :index] do
    resources :review_experiences, only: [ :new, :create, :destroy ]
    resources :favorites, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :travelboards do
    resources :review_travelboards, only: [ :new, :create, :destroy ]
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end

  resources :favorites, only: [:destroy] do
    member do
      patch :changeday
    end
  end
end
