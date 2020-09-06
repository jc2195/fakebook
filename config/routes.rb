Rails.application.routes.draw do
  devise_for :users,
             :controllers => { :registrations => "registrations", :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :users do
    resource :profile
  end
  resources :posts, :likes, :comments, :friend_requests, :friendships
end
