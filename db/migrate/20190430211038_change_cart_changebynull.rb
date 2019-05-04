class ChangeCartChangebynull < ActiveRecord::Migration[5.2]
  def change
    change_column :carts, :changed_by, :integer, null: true
  end
end
