class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :photo_url
      t.string :position
      t.string :year
      t.integer :age
      t.references :team, index: true, foreign_key: true
    end
  end
end
