Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parts

  get '/static' => 'parts#static'

  root 'parts#index'
end
