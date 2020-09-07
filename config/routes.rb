Rails.application.routes.draw do
  devise_for :users,
             :controllers => { :registrations => "registrations", :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :users, only: [:index, :show] do
    resource :profile, only: [:edit, :update]
  end
  resources :posts, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
end
