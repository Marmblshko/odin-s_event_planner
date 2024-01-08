Rails.application.routes.draw do
  devise_for :users
  get 'events/index'

  root "events#index"

  resources :events

  resources :users, only: [:show]

  resources :attendances, only: [:new, :destroy]

  resources :invites, only: [:new, :create]
end
