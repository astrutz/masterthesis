# frozen_string_literal: true

Rails.application.routes.draw do
  root 'overview#index'

  localized do
    namespace :send do
      root 'overview#index'
      get :navigate, to: 'navigate#index'
      get :capacities, to: 'capacities#index'
      resources :priorities
    end
    namespace :receive do
      root 'inboxes#show'
      get 'login', to: 'sessions#new', as: 'login'
      get 'logout', to: 'sessions#destroy', as: 'logout'
      get 'signup', to: 'recipients#new'
      resources :sessions
      resources :recipients
    end
    direct :create_recipients do
      { action: 'create', controller: 'receive/recipients' }
    end
  end
end
