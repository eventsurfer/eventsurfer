class UpdatePerformanceCartAddCount < ActiveRecord::Migration[5.2]
  def up
    add_column :performance_carts, :count, :integer, null:false
  end

  def down
    remove_column :performance_carts, :count
  end
end
