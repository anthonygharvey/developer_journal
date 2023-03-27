class CreateEntriesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.text :content
      t.string :languages
    end
  end
end
