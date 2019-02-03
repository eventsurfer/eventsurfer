class SetupTableGroupTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :group_ticket do |t|
      t.belongs_to :ticket, index:true
      t.belongs_to :order, index: true
    end

  end
end
