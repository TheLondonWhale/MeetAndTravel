Rails.application.routes.draw do

  resources :tips
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'home/private'
  root to: "home#index"

end
