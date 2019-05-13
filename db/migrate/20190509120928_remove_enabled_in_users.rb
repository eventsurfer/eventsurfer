class RemoveEnabledInUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :enabled
  end

  def down
    add_column :users, :enabled, :boolean, default: false
  end
end
