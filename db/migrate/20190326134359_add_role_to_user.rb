class AddRoleToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :role, :integer
  end

  def down
    remove_column :users, :role
  end
end
