class AddGoalIdToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :goal_id, :integer
  end
end
