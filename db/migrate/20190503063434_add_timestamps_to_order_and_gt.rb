class AddTimestampsToOrderAndGt < ActiveRecord::Migration[5.2]
  def up
    change_table :orders do |t|
      t.timestamps
    end

    change_table :group_tickets do |t|
      t.timestamps
    end
  end

  def down
    remove_column :orders, :created_at
    remove_column :orders, :updated_at
    remove_column :group_tickets, :created_at
    remove_column :group_tickets, :updated_at
  end
end
