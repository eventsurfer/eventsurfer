class Setup < ActiveRecord::Migration[5.2]
  def up
    create_table :performance_carts do |t|
      t.belongs_to :carts, index:true
      t.belongs_to :performances, index: true
      t.timestamps
    end
  end

  def down
    drop_table :performance_carts
  end
end
