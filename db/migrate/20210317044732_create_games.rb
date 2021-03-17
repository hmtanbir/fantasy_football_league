class CreateGames < ActiveRecord::Migration[5.2]
  def up
    create_table :games do |t|
      t.integer :match_number
      t.string :home_team
      t.string :away_team
      t.integer :home_team_goal, default: 0, nullable: false
      t.integer :away_team_goal, default: 0, nullable: false
      t.date :game_date
      t.references :game_session, foreign_key: true

      t.timestamps
    end
    add_index :games, [:home_team, :away_team, :game_session_id], unique: true, name: :games_unique_index
    add_index :games, [:match_number, :game_session_id], unique: true, name: :games_unique_match_index
  end

  def down
    remove_index :games, name: :games_unique_match_index
    remove_index :games, name: :games_unique_index
    drop_table :games
  end
end
