class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :num_players
      t.integer :day
      t.integer :night
      t.timestamps
    end
  end
end
