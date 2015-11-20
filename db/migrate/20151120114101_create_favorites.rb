class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
    end
  end
end
