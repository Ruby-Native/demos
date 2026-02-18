class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "cart", null: false
      t.datetime :placed_at
      t.integer :total, default: 0, null: false

      t.timestamps
    end
  end
end
