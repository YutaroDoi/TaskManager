# frozen_string_literal: true

class ChangeStatusToTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :status, :string, default: nil
    change_column :tasks, :status, :string, null: true
    change_column :tasks, :status, 'integer USING CAST(status AS integer)'
    change_column :tasks, :status, :integer, default: 0
    change_column :tasks, :status, :integer, null: false
  end

  def down
    change_column :tasks, :status, :string, default: '未着手'
    change_column :tasks, :status, :string, null: false
    change_column :tasks, :status, :string
    change_column :tasks, :status, :integer, default: nil
    change_column :tasks, :status, :integer, null: true
  end
end
