json.array!(@airplanes) do |airplane|
  json.extract! airplane, :id, :reg, :ac_type, :name, :j_capacity, :w_capacity, :y_capacity, :total_capacity, :ife, :new_livery
  json.url airplane_url(airplane, format: :json)
end
