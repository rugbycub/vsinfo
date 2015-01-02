json.array!(@turns) do |turn|
  json.extract! turn, :id, :aircraft, :arrival, :departure, :gate
  json.url turn_url(turn, format: :json)
end
