Rails.application.routes.draw do
  get '/admin', to: 'admin#index'

  resources :boat_brands, only: [:index]
end
