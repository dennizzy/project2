class Team < ActiveRecord::Base
	has_many :players
	has_many :users # NHO: belongs_to :user
	# NHO: currently our association is setup so that a team belongs_to a user,
	# How could we adjust that to implement a many to many relationship between user and teams?
end
