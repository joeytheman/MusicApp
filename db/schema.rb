# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160113030201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.integer  "genre_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artists", ["genre_id"], name: "index_artists_on_genre_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "genres", ["name"], name: "index_genres_on_name", unique: true, using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "playlists_songs", force: :cascade do |t|
    t.integer  "playlist_id"
    t.integer  "song_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playlists_songs", ["playlist_id"], name: "index_playlists_songs_on_playlist_id", using: :btree
  add_index "playlists_songs", ["song_id"], name: "index_playlists_songs_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.integer  "artist_id",                null: false
    t.integer  "genre_id",                 null: false
    t.integer  "times_played", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree
  add_index "songs", ["genre_id"], name: "index_songs_on_genre_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "artists", "genres"
  add_foreign_key "playlists", "users"
  add_foreign_key "playlists_songs", "playlists"
  add_foreign_key "playlists_songs", "songs"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "genres"
end
