class CreateBreweries < ActiveRecord::Migration[8.1]
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :brewery_type
      t.string :street
      t.string :city, default: "Portland"
      t.string :state, default: "Oregon"
      t.string :postal_code
      t.string :phone
      t.string :website_url
      t.decimal :latitude, precision: 10, scale: 7
      t.decimal :longitude, precision: 10, scale: 7
      t.string :open_brewery_db_id
      t.references :neighborhood, null: true, foreign_key: true

      t.timestamps
    end

    add_index :breweries, :open_brewery_db_id, unique: true
  end
end
