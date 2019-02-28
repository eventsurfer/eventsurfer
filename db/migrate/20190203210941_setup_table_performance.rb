class SetupTablePerformance < ActiveRecord::Migration[5.2]
  def change
    create_table :performance do |t|
      t.float :prize
      t.datetime :start
      t.datetime :stop
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :sell_allowed
      t.datetime :stop_selling
      t.integer :number_of_tickets
      t.integer :changed_by
    end
  end
end
