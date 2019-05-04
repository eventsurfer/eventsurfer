class RenameMailToEmail < ActiveRecord::Migration[5.2]
  def change
    rename_column :default_informations,:mail, :email
  end
end
