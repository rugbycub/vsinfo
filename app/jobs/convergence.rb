# # Populate the graph with some random points
# points = []
# (1..10).each do |i|
#   points << { x: i, y: rand(50) }
# end
# last_x = points.last[:x]

# Dashing.scheduler.every '2s', first_in: 1.second.since do
#   points.shift
#   last_x += 1
#   points << { x: last_x, y: rand(50) }

#   Dashing.send_event('convergence', points: points)
# end