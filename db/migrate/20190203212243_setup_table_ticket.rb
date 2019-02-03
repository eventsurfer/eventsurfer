class SetupTableTicket < ActiveRecord::Migration[5.2]
  def change
    drop_table :tickets
    create_table :tickets do |t|
      t.string :validate_id
      t.boolean :valid
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :changed_by
    end
  end
end
