Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:create, :new, :destroy]
  resources :goals
end
