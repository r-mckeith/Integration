Rails.application.routes.draw do
  # ASK
  passwordless_for :users
  resources :users do
    resources :parts
  end
  root 'static#index'
end
