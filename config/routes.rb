Rails.application.routes.draw do
  

  # devise_for :users
  # get '/register', to: 'users#index'
  # get 'login', to: 'sessions#index' 
  # post 'login', to: 'sessions#create'
  # root "posts#index"

  # resources :users, only: [:create]
  # resources :posts do
  #   resources :comments do
  #     resources :replies
  #   end
  # end

  devise_for :users
  resources :profiles
  
  root "profiles#new"

  resources :posts do
    resources :comments do
      resources :replies
    end
  end

end
