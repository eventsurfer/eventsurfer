class SetupTableEvent < ActiveRecord::Migration[5.2]
  def change
    drop_table :events
    create_table :events do |t|
      t.string :name
      t.datetime :start
      t.datetime :stop
      t.datetime :created_at
      t.datetime :updated_at
      t.string :hoster_name
      t.integer :changed_by
      t.string :website
      t.string :hotline
    end
  end
end
