Rails.application.routes.draw do
  devise_for :users
	  root to: 'teams#index'
	  resources :teams do
	    resources :players, only: [:create, :new, :update]
	  end
	  
	  resources :players, only: [:index, :edit, :show, :destroy] do
    		member do
      		post 'add_favorite'
      		delete 'remove_favorite'
    end
  end
end
