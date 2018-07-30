Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'
  resources :users
  root 'home#index'
  resources :cards
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
  post 'check_answer', to: 'home#check_answer'

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
