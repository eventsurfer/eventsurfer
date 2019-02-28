class SetupTableUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :email
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :rank
      t.string :password
      t.boolean :enabled
    end
  end
end
