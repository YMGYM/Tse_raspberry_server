class CreateLoads < ActiveRecord::Migration[6.0]
  def change
    create_table :loads do |t|
      t.references :task, null: false, foreign_key: true
      t.integer :percent

      t.timestamps
    end
  end
end
