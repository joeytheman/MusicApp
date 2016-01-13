class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
