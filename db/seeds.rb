# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative './player_data.rb'
require_relative './team_data.rb'

Player.destroy_all
Team.destroy_all

player_data = get_player_data()
team_data = get_team_data()

player_data.each_pair do |team_name, players|
  info = team_data[team_name]
  current_team = Team.create!({
    school_name: 	info[:school_name],
    photo_url:    	info[:photo_url],
    state:  		info[:state]
  })

  players.each do |player|
    Player.create!({
      name: 		player[:name],
      photo_url:    player[:photo_url],
      position: 	player[:position],
      year: 		player[:year],
      team:      	current_team
    })
  end
end
