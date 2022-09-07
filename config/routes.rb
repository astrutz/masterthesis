# frozen_string_literal: true

Rails.application.routes.draw do
  localized do
    namespace :sender do
      root 'overview#index'
      get :capacities, to: 'capacities#index'
      get :priorities, to: 'priorities#index'
    end
  end
end
