# frozen_string_literal: true

class AddSettingToTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :name, :string, default: ''
    change_column :tasks, :status, :string, default: '未着手'
  end

  def down
    change_column :tasks, :name, :string, default: '名無し'
    change_column :tasks, :status, :string, nil
  end
end
