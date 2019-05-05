class AddGroupTicketSinglePrice < ActiveRecord::Migration[5.2]
  def up
  add_column :group_tickets, :single_price, :string
end

def down
  remove_column :group_tickets, :single_price
end
end
