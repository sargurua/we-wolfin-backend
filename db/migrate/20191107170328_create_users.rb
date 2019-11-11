class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :game_id
      t.integer :role_id
      t.timestamps
    end
  end
end
