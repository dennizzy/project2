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

george_mason = Team.create!(                    
		school_name: "George Mason",
        photo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/f/f8/George_Mason_Patriots_logo.svg/1229px-George_Mason_Patriots_logo.svg.png",
        state: "Virginia")

dennis = Player.create!(
		name: "Dennis Truong",
		photo_url: "http://lh6.googleusercontent.com/-rpwI4wltXUM/AAAAAAAAAAI/AAAAAAAADXA/l96ETHD93vk/photo.jpg?sz=300",
		position: "Safety",
		year: "Alumni",
		age: 25,
		team: george_mason
	)