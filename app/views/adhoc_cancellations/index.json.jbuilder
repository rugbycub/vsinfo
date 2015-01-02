json.array!(@adhoc_cancellations) do |adhoc_cancellation|
  json.extract! adhoc_cancellation, :id, :date
  json.url adhoc_cancellation_url(adhoc_cancellation, format: :json)
end
