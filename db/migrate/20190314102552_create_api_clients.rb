class CreateApiClients < ActiveRecord::Migration[5.2]
  def change
    create_table :api_clients do |t|
      t.string :name
      t.string :auth_key, :limit => 128
      t.string :ip_address, :limit => 64
      t.timestamps
    end
  end
end
