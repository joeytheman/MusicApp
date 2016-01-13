class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :artist, index: true, foreign_key: true, null: false
      t.references :genre, index: true, foreign_key: true, null: false
      t.integer :times_played, default: 0, null: false

      t.timestamps null: false
    end
  end
end
