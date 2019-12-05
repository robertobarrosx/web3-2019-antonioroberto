Rails.application.routes.draw do
  
   
  get "home/index"
  root "home#index"
  devise_for :users
  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'
  resources :verses
  resources :testaments
  resources :ministries
  resources :churches
  resources :users
  resources :book
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
