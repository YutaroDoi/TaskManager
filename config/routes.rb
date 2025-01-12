# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :tasks
  resources :labels, only: %i[create destroy]

  namespace :admin do
    resources :users
  end
end
