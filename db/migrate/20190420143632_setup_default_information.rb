class SetupDefaultInformation < ActiveRecord::Migration[5.2]
  def up
    create_table :default_information do |t|

      t.string :company, null: false, limit: 1000
      t.string :street, null: false, limit: 1000
      t.string :country, null: false, limit: 100
      t.string :city, null: false, limit: 100
      t.string :postcode, null: false, limit: 15
      t.string :street_number, null: false, limit: 10
      t.string :cellphone, null: false, limit: 20
      t.string :website, null: false, limit: 100
      t.string :mail, null: false, limit: 120
      t.integer :changed_by, null: false
      t.timestamps
    end
  end

  def down
    drop_table :default_information
  end
end
