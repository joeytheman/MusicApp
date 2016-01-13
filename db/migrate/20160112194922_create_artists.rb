class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.references :genre, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
