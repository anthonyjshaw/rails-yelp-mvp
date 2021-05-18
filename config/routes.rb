# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'restaurants#index'
  get 'restaurants/search', to: 'restaurants#search'
  resources :restaurants do
    resources :reviews, only: %i[new create]
  end
end
