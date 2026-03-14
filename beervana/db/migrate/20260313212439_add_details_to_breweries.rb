class AddDetailsToBreweries < ActiveRecord::Migration[8.1]
  def change
    add_column :breweries, :hours, :text
    add_column :breweries, :happy_hour, :text
    add_column :breweries, :food, :string
    add_column :breweries, :outdoor_seating, :boolean
    add_column :breweries, :dog_friendly, :boolean
    add_column :breweries, :events, :text
  end
end
