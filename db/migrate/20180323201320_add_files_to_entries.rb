class AddFilesToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :files, :string
  end
end
