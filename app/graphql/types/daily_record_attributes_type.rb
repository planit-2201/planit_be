class Types::DailyRecordAttributesType < Types::BaseInputObject
  argument :date, String, 'Date of record', required: true
  argument :bag_count, String, 'Count of plastic bag used', required: true
  argument :straw_count, String, 'Count of straw used', required: true
  argument :container_count, String, 'Count of container used', required: true
  argument :shower_time, String, 'Shower time in seconds', required: true
end
