class CreateTodos < ActiveRecord::Migration[8.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :due_at
      t.datetime :completed_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :todos, :completed_at
  end
end
