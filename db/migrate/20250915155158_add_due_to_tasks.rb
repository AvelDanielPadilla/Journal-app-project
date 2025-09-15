class AddDueToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :duedate, :date
  end
end
