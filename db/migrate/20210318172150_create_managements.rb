class CreateManagements < ActiveRecord::Migration[5.2]
  def up
    create_table :managements do |t|
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.references :game_session, foreign_key: true

      t.timestamps
    end
    add_index :managements, [:team_id, :player_id, :game_session_id], unique: true, name: :management_unique_index
  end

  def down
    remove_index :managements, name: :management_unique_index
    drop_table :managements
  end
end
