class ChangeDefaultValueForPaidInOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :paid, :boolean, null: false, default: false
  end
end
