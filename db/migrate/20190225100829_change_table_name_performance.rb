class ChangeTableNamePerformance < ActiveRecord::Migration[5.2]
  def change
    rename_table :performance, :performances
  end
end
