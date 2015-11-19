class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :school_name
      t.string :photo_url
      t.string :state
    end
  end
end
