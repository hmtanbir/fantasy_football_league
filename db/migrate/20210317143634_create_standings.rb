class CreateStandings < ActiveRecord::Migration[5.2]
  def up
    create_table :standings do |t|
      t.string :team
      t.integer :match_played, default: 1, nullable: false
      t.integer :win, default: 0, nullable: false
      t.integer :lose, default: 0, nullable: false
      t.integer :draw, default: 0, nullable: false
      t.integer :gf, default: 0, nullable: false
      t.integer :ga, default: 0, nullable: false
      t.integer :gd, default: 0, nullable: false, unsigned: true
      t.references :game_session, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :standings
  end
end
