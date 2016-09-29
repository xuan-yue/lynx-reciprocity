json.array!(@asks) do |ask|
  json.extract! ask, :id, :user_id, :event_id, :ask, :details
  json.url ask_url(ask, format: :json)
end
