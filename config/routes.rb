Rails.application.routes.draw do
  post      'login',  to: 'sessions#create',  as: :login
  delete    'logout', to: 'sessions#destroy', as: :logout

  resource  :wallet,  only: [:show]
  resources :refills, only: [:create, :index]
  resources :payments, only: [:create, :index]
  resource  :payment_token,  only: [:show]
end
