class AddTableUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :enabled
      t.boolean :admin
      t.date :regestration_date
    end
  end
end
