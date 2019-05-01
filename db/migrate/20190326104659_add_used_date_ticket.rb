class AddUsedDateTicket < ActiveRecord::Migration[5.2]
  def up
    add_column :tickets, :used_at, :datetime, default: nil
  end

  def down
    remove_column :tickets, :used_at
  end
end
