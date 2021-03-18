class CreatePlayers < ActiveRecord::Migration[5.2]
  def up
    create_table :players do |t|
      t.string :name
      t.string :country
      t.integer :age
      t.integer :transfer_fees

      t.timestamps
    end
  end

  def down
    drop_table :players
  end
end
