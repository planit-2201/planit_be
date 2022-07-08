class CreateDailyRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_records do |t|
      t.string :date
      t.integer :bag_count
      t.integer :container_count
      t.integer :straw_count
      t.integer :shower_time

      t.timestamps
    end
  end
end
