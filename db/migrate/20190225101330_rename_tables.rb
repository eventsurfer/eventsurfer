class RenameTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :group_ticket, :group_tickets
    rename_table :performance_event, :performance_events
    rename_table :performance_location, :performance_locations
  end
end
