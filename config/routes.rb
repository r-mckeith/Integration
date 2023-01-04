Rails.application.routes.draw do
  passwordless_for :users
  resources :users
  resources :parts
  root 'static#index'
end
