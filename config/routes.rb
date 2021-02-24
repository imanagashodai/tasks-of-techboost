Rails.application.routes.draw do
  get 'tags/new'
  get 'tags/index'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'
  get "pages/link", to: "pages#link"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy' #課題1
end