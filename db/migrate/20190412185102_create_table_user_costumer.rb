class CreateTableUserCostumer < ActiveRecord::Migration[5.2]
  def change
    create_table :costumers do |t|
      t.string :address, null: false
      t.string :cellphone, null: false, :limit => 20
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
