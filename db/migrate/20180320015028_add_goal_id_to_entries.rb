class AddGoalIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :goal_id, :integer
  end
end
