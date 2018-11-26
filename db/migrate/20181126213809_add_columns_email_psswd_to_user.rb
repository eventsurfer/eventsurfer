class AddColumnsEmailPsswdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :psswrd, :string, :limit => 128)
    add_column(:users, :email, :string, :limit => 256)
  end
end
