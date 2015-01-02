json.array!(@operations) do |operation|
  json.extract! operation, :id, :city, :date, :staff_assignment
  json.url operation_url(operation, format: :json)
end
