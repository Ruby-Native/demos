class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :base_price
      t.string :image_url
      t.integer :position
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
