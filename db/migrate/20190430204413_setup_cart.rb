class SetupCart < ActiveRecord::Migration[5.2]
  def up
    create_table :carts do |t|
      t.integer :user_id, null: false
      t.timestamps
      t.integer :changed_by, null: false
    end
  end

  def down
    drop_table :carts
  end
end
