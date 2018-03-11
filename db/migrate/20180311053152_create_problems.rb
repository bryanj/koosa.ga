class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.integer :level

      t.timestamps
    end
    add_index :problems, :level
  end
end
