class AddDescriptionFieldToEvents < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :description, :string, :default => "", null: false
  end

  def down
    remove_column :events, :description
  end
end
