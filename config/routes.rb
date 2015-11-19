Rails.application.routes.draw do
  devise_for :users
	  root to: 'teams#index'
	  resources :teams do
	    resources :players, only: [:create, :new, :update]
	  end

	  resources :players, only: [:index, :edit, :show, :destroy]
end
# explain the only: and what does it do?

# why did you write resources:players twice?
# make sure you omit edit and destroy in your second resource for players
