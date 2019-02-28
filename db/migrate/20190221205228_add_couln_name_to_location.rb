class AddCoulnNameToLocation < ActiveRecord::Migration[5.2]
  def up
    add_column :locations, :name, :string, default: "", null:false
  end

  def down
    remove_column :locations, :name
  end
end
