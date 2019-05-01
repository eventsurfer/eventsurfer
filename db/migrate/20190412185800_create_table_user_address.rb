class CreateTableUserAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :costumers, :address, :integer, null: false
    add_column :costumers, :changded_by, :integer, null:false
    create_table :costumer_addresses do |t|
      t.string "street"
      t.string "postcode"
      t.string "city"
      t.string "country"
      t.string "street_number"
      t.timestamps null: false
      t.integer "changed_by"
    end
  end
end
