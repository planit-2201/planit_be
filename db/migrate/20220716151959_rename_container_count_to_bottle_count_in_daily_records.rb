class RenameContainerCountToBottleCountInDailyRecords < ActiveRecord::Migration[7.0]
  def change
    rename_column :daily_records, :container_count, :bottle_count
  end
end
