class AddKidFriendlyAndWifiToBreweries < ActiveRecord::Migration[8.1]
  def change
    add_column :breweries, :kid_friendly, :boolean
    add_column :breweries, :wifi, :boolean
  end
end
