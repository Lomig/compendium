# frozen_string_literal: true

Rails.application.routes.draw do
  get 'games/index'
  get 'games/show'
  devise_for :users

  resources :games, only: %i[index show]
end
