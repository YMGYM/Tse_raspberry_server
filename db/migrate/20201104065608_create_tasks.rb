class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :dueDate
      t.references :user
      t.boolean :finish, default: false
      t.timestamps
    end
  end
end
