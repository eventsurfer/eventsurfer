class ChangeTypeOfSinglepriceInGroupTicketsToFloat < ActiveRecord::Migration[5.2]
  def up
    change_column :group_tickets, :single_price,'decimal', null:false, default: 0.0
  end

  def down
    change_column :group_tickets, :single_price, :string
  end
end
