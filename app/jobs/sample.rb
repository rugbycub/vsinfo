# current_valuation = 0
# current_karma = 0

 Dashing.scheduler.every '2s', first_in: 1.second.since do
#   last_valuation = current_valuation
#   last_karma     = current_karma
#   current_valuation = rand(100)
#   current_karma     = rand(200000)

#   Dashing.send_event('valuation', { current: current_valuation, last: last_valuation })
#   Dashing.send_event('karma', { current: current_karma, last: last_karma })
   Dashing.send_event('synergy',   { value: rand(100) })
 end