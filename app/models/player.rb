class Player < ActiveRecord::Base
	belongs_to :team
	# NHO: currently, we cannot destroy any team or player, of which there is a `favorited_player`,
	has_many :favorites # NHO: we could fix that by applying `dependent: :destroy` on our has_many associations

 	has_many :users, through: :favorites
end
