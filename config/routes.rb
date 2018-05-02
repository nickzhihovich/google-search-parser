Rails.application.routes.draw do
  root to: 'queries#index'
  resources :queries
end
