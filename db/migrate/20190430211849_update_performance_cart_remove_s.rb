class UpdatePerformanceCartRemoveS < ActiveRecord::Migration[5.2]
  def change
    rename_column :performance_carts, :performances_id , :performance_id
    rename_column :performance_carts, :carts_id , :cart_id
  end
end
