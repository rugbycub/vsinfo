json.array!(@airports) do |airport|
  json.extract! airport, :id, :code, :name, :city, :country, :latlon, :timezone
  json.url airport_url(airport, format: :json)
end
