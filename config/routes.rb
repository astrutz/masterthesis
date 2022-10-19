# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
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
      get 'message/:id/delete', to: 'messages#destroy', as: 'delete_message'
      get 'settings', to: 'recipients#edit'
      patch 'settings', to: 'recipients#update'
      get 'rule/:id/delete', to: 'rules#destroy', as: 'delete_rule'
      resources :sessions
      resources :recipients
      resources :messages
      resources :rules
    end
    direct :create_recipients do
      { action: 'create', controller: 'receive/recipients' }
    end
  end
end
