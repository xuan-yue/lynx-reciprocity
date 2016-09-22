json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :picture, :url, :startDate, :endDate
  json.url event_url(event, format: :json)
end
