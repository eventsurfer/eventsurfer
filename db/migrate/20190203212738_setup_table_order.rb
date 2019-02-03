class SetupTableOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :paid
      t.datetime :paid_at
      t.string :payment_method
      t.integer :changed_by
    end
  end
end
