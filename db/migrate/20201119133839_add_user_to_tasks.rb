class AddUserToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :users, :references
  end
end
