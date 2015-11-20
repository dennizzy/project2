# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.destroy_all
Team.destroy_all
User.destroy_all

george_mason = Team.create!(                    
		school_name: "George Mason",
        photo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/f/f8/George_Mason_Patriots_logo.svg/1229px-George_Mason_Patriots_logo.svg.png",
        state: "Virginia")

umcp = Team.create!(                    
		school_name: "University of Maryland, College Park",
        photo_url: "http://s7d2.scene7.com/is/image/Fathead/lgo_ncaa_maryland_terrapins?layer=comp&fit=constrain&hei=300&wid=300&fmt=png-alpha&qlt=95,0&op_sharpen=1&resMode=bicub&op_usm=0.0,0.0,0,0&iccEmbed=0",
        state: "Maryland")

admin = User.create!(
  email: 'admin@admin.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)