class SetupTablePerformanceEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_event do |t|
      t.belongs_to :event, index: true
      t.belongs_to :performance, index: true
    end
  end
end
