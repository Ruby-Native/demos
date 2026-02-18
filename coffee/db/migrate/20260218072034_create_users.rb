class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :favorite_store
      t.integer :reward_points, default: 0, null: false

      t.timestamps
    end
  end
end
