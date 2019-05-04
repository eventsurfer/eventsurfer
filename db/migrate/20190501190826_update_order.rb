class UpdateOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :group_id
  end
end
