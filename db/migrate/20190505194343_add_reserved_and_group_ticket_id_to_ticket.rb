class AddReservedAndGroupTicketIdToTicket < ActiveRecord::Migration[5.2]
  def up
    add_column :tickets, :reserved, :integer, default: 0
    add_column :tickets, :group_id, :integer, default: 0
  end

  def down
    remove_column :tickets, :reserved
    remove_column :tickets, :group_id
  end
end
