class AddTimestampsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :created_at, :datetime
    add_column :entries, :updated_at, :datetime
  end
end
