Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  resources :clubs

  root 'clubs#index'
end
