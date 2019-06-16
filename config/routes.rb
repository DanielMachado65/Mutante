Rails.application.routes.draw do
  get 'login', to: 'users#show'
  post 'create', to: 'users#create'

  resources :users
  resources :mutantes

  root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
