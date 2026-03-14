class AddPhotoAttributionToBreweries < ActiveRecord::Migration[8.1]
  def change
    add_column :breweries, :photo_attribution, :string
  end
end
