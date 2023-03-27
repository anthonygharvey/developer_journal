class AddTimestampsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :created_at, :datetime
    add_column :entries, :updated_at, :datetime
  end
end
