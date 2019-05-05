class AddColumnChangedByToUsersAndSettingsAndApiClients < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :changed_by, :integer
    add_column :api_clients, :changed_by, :integer
    add_column :settings, :changed_by, :integer
  end

  def down
    remove_column :settings, :changed_by
    remove_column :users, :changed_by
    remove_column :api_clients, :changed_by
  end
end
