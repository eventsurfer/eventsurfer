class CreatePerfomanceTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :perfomance_tickets do |t|
      t.belongs_to :tickets, index:true
      t.belongs_to :performances, index: true
    end
  end
end
