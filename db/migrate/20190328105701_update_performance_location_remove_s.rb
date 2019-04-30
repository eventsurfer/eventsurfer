class UpdatePerformanceLocationRemoveS < ActiveRecord::Migration[5.2]
  def change
    rename_column :performance_tickets, :performances_id , :performance_id
    rename_column :performance_tickets, :tickets_id , :ticket_id
  end
end
