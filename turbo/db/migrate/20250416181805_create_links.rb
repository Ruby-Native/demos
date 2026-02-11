class CreateLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :url, null: false
      t.text :description

      t.timestamps
    end
  end
end
