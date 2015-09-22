Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :goals do
    member do
      post 'complete'
    end
  end

  resources :comments, only: [:create, :destroy]
end
