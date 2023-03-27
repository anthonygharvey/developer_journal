class CreateGoalsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.integer :duration_in_days
      t.string  :languages
    end
  end
end
