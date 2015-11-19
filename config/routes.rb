Rails.application.routes.draw do
  root to: 'teams#index'
  resources :teams do
    resources :players, only: [:create, :new, :update]
  end
  
  resources :players, only: [:index, :edit, :show, :destroy]
end
