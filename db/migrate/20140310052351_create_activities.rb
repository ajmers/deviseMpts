class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :content
      t.integer :num_times_ranked
      t.decimal :avg_score
      t.integer :user_id

      t.timestamps
    end
  end
end
