class AddTableEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :eventName
      t.integer :numberOfTickets

    end
  end
end
