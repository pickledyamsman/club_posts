Rails.application.routes.draw do
  resources :types
  resources :members
  resources :posts
  resources :clubs
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  resources :users do
    resources :clubs, only: [:index, :show]
    resources :posts
  end

  root 'clubs#index'
end
