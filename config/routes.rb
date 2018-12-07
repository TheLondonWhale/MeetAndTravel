Rails.application.routes.draw do

  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: "home#index"
  resources :conversations do
    resources :messages
  end

  resources :tips do
   resources :likes
  end
  resources :tips do
    resources :comments
  end

end
