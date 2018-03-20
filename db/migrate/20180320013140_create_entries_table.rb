class CreateEntriesTable < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :content
      t.string :languages
    end
  end
end
