class RenameValidInTicketsToValid < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :valid,:valid_
  end
end
