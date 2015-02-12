# Airport.each do |airport|
#   if airport.tickers.count != 0
#     ticker_items = []
#     airport.tickers.each {|ticker| ticker_items.push(ticker.ticker_item.to_s)}

#     Dashing.scheduler.every '10m', first_in: 1.second.since, allow_overlapping: false do
#       Dashing.send_event( "_ticker", { :items => ticker_items } )
#     end
#   end
# end