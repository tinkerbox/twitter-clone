Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:show] do
    resources :tweets, only: [:index, :show]
    resources :follows, only: [:index]
    resources :followers, only: [:index]
    resources :likes, only: [:index]
  end

  resource :account, only: [:new, :create]
  resource :search, only: [:show]

  namespace :my do
    get '/', to: redirect('/my/home')
    resource :home, only: [:show]
    resource :account, only: [:edit, :update, :destroy]
    resources :tweets, only: [:new, :create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
    resources :follows, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]

  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out
end
