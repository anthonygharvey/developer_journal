class AddNameAttributeToGoalsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :name, :string
  end
end
