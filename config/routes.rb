Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :items, only: [:index, :show]

  resource :cart

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :orders, only: [:index, :show, :create, :update]

  namespace :admin do
    get '/dashboard', to: 'admin#show'
    resources :items, only: [:new, :create, :index, :edit, :update]
  end

  get '/dashboard', to: 'users#show'

  resources :users, only: [:new, :create, :show, :update, :edit]

  resources :categories, path: '/', only: [:show]

  resources :settings, except: [:show, :new, :edit]
end
