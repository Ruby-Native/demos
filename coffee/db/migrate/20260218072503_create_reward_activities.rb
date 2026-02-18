class CreateRewardActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :reward_activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.integer :points

      t.timestamps
    end
  end
end
