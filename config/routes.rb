Rails.application.routes.draw do
  post 'login', to: 'sessions#create', as: :login
  delete 'logout', to: 'sessions#destroy', as: :logout
  resource :wallet, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
