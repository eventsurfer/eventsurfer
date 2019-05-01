class UpdateGroupTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :group_tickets, :ticket_id , :performance_id
    add_column :group_tickets, :count, :integer
  end
end
