json.extract! train_schedule, :id, :departs, :arrives, :departs_time, :arrives_time, :train_id, :created_at, :updated_at
json.url train_schedule_url(train_schedule, format: :json)
