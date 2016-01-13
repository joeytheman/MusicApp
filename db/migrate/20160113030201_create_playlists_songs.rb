class CreatePlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs do |t|
      t.references :playlist, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
