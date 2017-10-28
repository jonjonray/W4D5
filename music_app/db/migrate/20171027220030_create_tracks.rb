class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :ord
      t.text :lyrics
      t.integer :album_id
      t.timestamps
    end
    add_index :tracks, :title
    add_index :tracks,:album_id
  end
end
