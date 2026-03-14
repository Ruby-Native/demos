class CreateNeighborhoods < ActiveRecord::Migration[8.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name, null: false
      t.integer :position, default: 0

      t.timestamps
    end

    add_index :neighborhoods, :name, unique: true
  end
end
