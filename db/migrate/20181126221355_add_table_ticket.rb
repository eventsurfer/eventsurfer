class AddTableTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :eventId
      t.string :eventName
      t.integer :userId
    end

    end
  end

