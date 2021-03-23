# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  get 'user/logout', to: 'users#logout', as: :user_logout
  devise_for :users

  resources :games, only: %i[index show]
  resources :campaigns, only: %i[show]

  resource :dashboard, only: %i[show] do
    member { get :me }
  end

  resource :user, only: %i[update] do
    member { patch :avatar_update }
  end
end
