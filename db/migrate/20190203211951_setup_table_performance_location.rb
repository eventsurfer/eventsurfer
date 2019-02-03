class SetupTablePerformanceLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_location do |t|
      t.belongs_to :performance, index: true
      t.belongs_to :location, index:true
    end
  end
end
