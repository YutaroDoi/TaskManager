class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :expire
      t.string :status
      t.string :label
      t.integer :priority

      t.timestamps
    end
  end
end
