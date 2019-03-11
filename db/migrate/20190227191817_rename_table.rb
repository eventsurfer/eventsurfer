class RenameTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :perfomance_tickets, :performance_tickets
  end
end
