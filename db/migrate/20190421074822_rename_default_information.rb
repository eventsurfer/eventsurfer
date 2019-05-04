class RenameDefaultInformation < ActiveRecord::Migration[5.2]
  def change
    rename_table :default_information, :default_informations
  end
end
