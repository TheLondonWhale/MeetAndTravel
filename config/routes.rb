Rails.application.routes.draw do

  # get 'errors/not_found'
  # get 'errors/internal_server_error'
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

  resources :tips do
    collection do
      get :recent
      get :oldest
      get :upvoted
      get :downvoted
    end
  end
  resources :searches

  # match "/404", :to => "errors#not_found", :via => :all
  # match "/500", :to => "errors#internal_server_error", :via => :all


end
