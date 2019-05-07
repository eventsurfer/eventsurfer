class UpdateOrderPaymentmethod < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :payment_method, :integer, null: true
  end

  def down
    change_column :orders, :payment_method, :string
  end
end
