# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_18_172150) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "game_sessions", force: :cascade do |t|
    t.string "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "match_number"
    t.string "home_team"
    t.string "away_team"
    t.integer "home_team_goal", default: 0
    t.integer "away_team_goal", default: 0
    t.date "game_date"
    t.integer "game_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_games_on_game_session_id"
    t.index ["home_team", "away_team", "game_session_id"], name: "games_unique_index", unique: true
    t.index ["match_number", "game_session_id"], name: "games_unique_match_index", unique: true
  end

  create_table "managements", force: :cascade do |t|
    t.integer "team_id"
    t.integer "player_id"
    t.integer "game_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_managements_on_game_session_id"
    t.index ["player_id"], name: "index_managements_on_player_id"
    t.index ["team_id", "player_id", "game_session_id"], name: "management_unique_index", unique: true
    t.index ["team_id"], name: "index_managements_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.integer "age"
    t.integer "transfer_fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standings", force: :cascade do |t|
    t.string "team"
    t.integer "match_played", default: 1
    t.integer "win", default: 0
    t.integer "lose", default: 0
    t.integer "draw", default: 0
    t.integer "gf", default: 0
    t.integer "ga", default: 0
    t.integer "gd", default: 0
    t.integer "game_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_standings_on_game_session_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
