class RemoveLabelFromTasks < ActiveRecord::Migration[5.2]
  def up
    remove_column :tasks, :label
      end

  def down
    add_column :tasks, :label, :string
  end
end
