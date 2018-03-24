class AddEndDateToGoalsTable < ActiveRecord::Migration
  def change
    add_column :goals, :end_date, :datetime
  end
end
