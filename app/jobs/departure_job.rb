# current_valuation = 0
# current_karma = 0
# j_capacity = 45
# w_capacity = 38
# y_capacity = 225
# total_capacity = j_capacity + w_capacity + y_capacity

# def capacity (cabin)
# 	cabin
# end

# def max_capacity (capacity)
# 	((capacity*0.25).ceil)+capacity
# end

# def capacity_warning(capacity)
# 	capacity - ((capacity*0.1).ceil)
# end

# Dashing.scheduler.every '10s', first_in: 1.second.since do
# 	departure1 = Departure.find(1)
# 	puts departure1.etd
#   Dashing.send_event('departure1',   {
#   	departure: departure1,
#   	value_j: rand(max_capacity(j_capacity)), 
#   	value_w: rand(max_capacity(w_capacity)), 
#   	value_y: rand(max_capacity(y_capacity)), 
#   	value_total: rand(max_capacity(total_capacity)), 
#   	min: 0, 
#   	max_j: max_capacity(j_capacity), 
#   	max_w: max_capacity(w_capacity), 
#   	max_y: max_capacity(y_capacity), 
#   	max_total: max_capacity(total_capacity), 
#   	thresholds_j: {oversold: capacity(j_capacity), warning: capacity_warning(j_capacity)},
#   	thresholds_w: {oversold: capacity(w_capacity), warning: capacity_warning(w_capacity)},
#   	thresholds_y: {oversold: capacity(y_capacity), warning: capacity_warning(y_capacity)},
#   	thresholds_total: {oversold: capacity(total_capacity), warning: capacity_warning(total_capacity)} })
# end

