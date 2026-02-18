class CreateOrderItemExtras < ActiveRecord::Migration[8.1]
  def change
    create_table :order_item_extras do |t|
      t.references :order_item, null: false, foreign_key: true
      t.string :name
      t.integer :price, default: 0, null: false

      t.timestamps
    end
  end
end
