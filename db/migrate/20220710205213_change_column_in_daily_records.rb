class ChangeColumnInDailyRecords < ActiveRecord::Migration[7.0]
  def change
    change_column :daily_records, :bag_count, :integer, :default => 0
    change_column :daily_records, :container_count, :integer, :default => 0
    change_column :daily_records, :straw_count, :integer, :default => 0
    change_column :daily_records, :shower_time, :integer, :default => 0
  end
end