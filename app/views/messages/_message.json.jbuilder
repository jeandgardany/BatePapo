json.extract! message, :id, :texto, :user_id, :sala_id, :created_at, :updated_at
json.url message_url(message, format: :json)
