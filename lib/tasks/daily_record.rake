desc 'Create previous day DailyRecords for all users who did not submit a record'
task daily_record: :environment do
  # Rails.logger.info "Whenever task"
  DailyRecord.generate_previous_day_records
end
