class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :year
      t.boolean :studio_album, default: true
      t.integer :band_id
      t.timestamps
    end
    add_index :albums, :title
    add_index :albums, :band_id
  end
end
