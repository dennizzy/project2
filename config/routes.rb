Rails.application.routes.draw do
  devise_for :users
	  root to: 'teams#index'
	  resources :teams do
	    resources :players, only: [:create, :new, :update]
	  end

    # NHO: What's the functionality of `favoriting` a player? Is there an interface to see a users `favorite_players`?
	  resources :players, only: [:index, :edit, :show, :destroy] do
    		member do
      		post 'add_favorite'
      		delete 'remove_favorite'
    end
  end
end
