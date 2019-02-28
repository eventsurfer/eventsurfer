class SetupTableLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :postcode
      t.string :city
      t.string :country
      t.string :street_number
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :changed_by
    end
  end
end
