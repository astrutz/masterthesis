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
    # namespace :recipient do
    #
    # end
  end
end
