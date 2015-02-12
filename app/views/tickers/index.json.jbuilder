json.array!(@tickers) do |ticker|
  json.extract! ticker, :id, :airport_id, :ticker_item
  json.url ticker_url(ticker, format: :json)
end
