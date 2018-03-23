class AddFilesToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :files, :string
  end
end
