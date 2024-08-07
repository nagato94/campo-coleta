Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      get 'authentication/login'
      post 'auth/login', to: 'authentication#login'
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :visits, only: [:index, :create, :show, :update, :destroy]
      resources :formularies, only: [:index, :create, :show, :update, :destroy]
      resources :questions, only: [:index, :create, :show, :update, :destroy]
      resources :answers, only: [:index, :create, :show, :update, :destroy]
      get '/', to: 'home#index'
    end
  end
end
