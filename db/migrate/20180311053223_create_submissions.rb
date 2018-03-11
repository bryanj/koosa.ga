class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :problem_id
      t.integer :memory
      t.integer :time
      t.string :language
      t.integer :length

      t.timestamps
    end
    add_index :submissions, :user_id
    add_index :submissions, :problem_id
  end
end
