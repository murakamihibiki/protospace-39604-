Rails.application.routes.draw do
  get 'prototypes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :prototypes do
  root to: 'prototypes#index'
  
end
root to: 'prototypes#index'
end