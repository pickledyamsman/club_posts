Rails.application.routes.draw do
  resources :posts
  resources :clubs
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  resources :users do
    resources :clubs, only: [:index, :show]
    resources :posts, only: [:index]
  end

  root 'clubs#index'
end
