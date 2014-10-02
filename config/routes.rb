Rails.application.routes.draw do
  
  root to: "admin#index"
 
  devise_for :users

  get 'log_in', to: 'users/sessions#new'
  resources :boat_brands, only: [:index, :create]
end
