Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'

  root 'home#index'

  resources :users

  resources :cards do
    post 'check_answer', to: 'home#check_answer'
  end

  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new'
  post 'logout' => 'user_sessions#destroy'

  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider
  delete 'oauth/:provider' => 'oauths#destroy', :as => :delete_oauth

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
