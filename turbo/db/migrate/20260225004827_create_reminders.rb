class CreateReminders < ActiveRecord::Migration[8.0]
  def change
    create_table :reminders do |t|
      t.references :link, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :send_at, null: false
      t.timestamps
    end
  end
end
