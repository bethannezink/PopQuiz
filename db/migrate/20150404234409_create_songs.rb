class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :full_song_url
      t.string :preview_url
      t.integer :album_id
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
