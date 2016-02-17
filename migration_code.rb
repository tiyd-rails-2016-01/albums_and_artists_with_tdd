class AlbumsAndArtistsMigration < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :albums do |t|
      t.references :artist
      t.string :name
      t.integer :inventory
      t.decimal :base_price, precision: 8, scale: 2
      t.decimal :discount, precision: 3, scale: 3
      t.timestamps null: false
    end
  end
end
