# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'restaurants#index'
  resources :restaurants, only: %i[new create show index] do
    collection do
      get :search, as: :search
    end
    resources :reviews, only: %i[new create]
  end
end
