Rails.application.routes.draw do
  passwordless_for :users
  resources :parts
  root 'parts#index'
end
