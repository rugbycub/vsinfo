json.array!(@positions) do |position|
  json.extract! position, :id, :name, :certification
  json.url position_url(position, format: :json)
end
