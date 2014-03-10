class AddScoresToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points_won, :decimal
    add_column :users, :partic_points, :decimal
  end
end
