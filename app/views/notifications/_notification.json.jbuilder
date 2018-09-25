json.extract! notification, :id, :message_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
