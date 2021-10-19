class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :description
      t.integer :status
      t.boolean :import
      t.boolean :urgent

      t.timestamps null: false
    end
  end
end
