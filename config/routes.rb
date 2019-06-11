Rails.application.routes.draw do
  resources :mutantes

  root 'mutantes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
