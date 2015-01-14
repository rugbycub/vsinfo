# # require 'HTTParty'
# # require 'json'
# # require 'crack'
# # require 'pry'

# # airport_code = 'LAX'

# # wait_time_values = ["No Wait", "1-10 minutes", "11-20 minutes", "21-30 minutes", "31+ minutes"]
# # airports_resource = 'http://www.tsa.gov/data/apcp.xml'
# # airport_checkpoint_resource = 'http://apps.tsa.dhs.gov/MyTSAWebService/GetWaitTimes.ashx'
# # airport_name = airport_code


# # Dashing.scheduler.every '5m', first_in: 1.second.since do |job|
# #   airport_checkpoint_waittimes = []
# #   output = []
# #   airports_resource_response = HTTParty.get(airports_resource)

# #   airports_resource_xml = Crack::XML.parse(airports_resource_response.body)
# #   airports_resource_json = Crack::JSON.parse(airports_resource_xml.to_json)

# #   airports_resource_json['airports']['airport'].each do |airport|
# #     if airport['shortcode'] == airport_code.upcase
# #       airport_name = airport['name']

# #       # Stupidness in JSON convesion.. SHould always be array
# #       if !airport['checkpoints']['checkpoint'].kind_of?(Array)
# #         airport['checkpoints']['checkpoint'] = [airport['checkpoints']['checkpoint']]
# #       end

# #       # Airport Checkpoints
# #       airport['checkpoints']['checkpoint'].each do |checkpoint|
# #          #puts "Getting Checkpoints"
# #          #puts "Checkpoint Id: " + checkpoint['id']
# #          #puts "Checkpoint Name: " + checkpoint['longname']

# #          airport_checkpoint_resouce_response = HTTParty.get(airport_checkpoint_resource, { :query => { :ap => airport_code, :output => 'json'} })
# #          airport_checkpoint_resouce_json = JSON.parse(airport_checkpoint_resouce_response.body)

# #          airport_checkpoint_resouce_json['WaitTimes'].each do |waittime|
# #           if waittime['CheckpointIndex'] == checkpoint['id']
# #             #puts "Wait Time " + waittime['WaitTimeIndex'] + " minutes"
# #             #puts "Updated: " + waittime["Created_Datetime"] #9/2/2013 2:24:33 AM
# #             #
# #             checkpoint_last_updated_at = DateTime.strptime(waittime["Created_Datetime"], '%m/%d/%Y %H:%M:%S %p')


# #               # puts waittime["Created_Datetime"] + " Is TODAY!"
# #               airport_checkpoint_waittimes << {
# #                 :id        => checkpoint["id"],
# #                 :name       => checkpoint["longname"],
# #                 :wait_time  => waittime['WaitTimeIndex'],
# #                 :updated_at => checkpoint_last_updated_at
# #               }
# #             end
# #           end

# #       end
# #     end
# #   end

# #   # Create groups of checkpoints
# #   groups = Hash.new{|h,k| h[k] = [] }
# #   airport_checkpoint_waittimes.each {|checkpoint| groups[checkpoint[:id]] << checkpoint }

# #   # parse checkpoints into new hash
# #   groups.each do |group, data|
# #     data.sort_by!{ |c| c[:updated_at].to_s.to_i}
# #     if data.size > 1

# #       output << {
# #         :id          => data[0][:id],
# #         :name        => data[0][:name],
# #         :wait_time   => wait_time_values[(data[0][:wait_time].to_i) - 1],
# #         :update      => data[0][:updated_at]
# #       }
# #     else
# #       output << {
# #         :id         => data[0][:id],
# #         :name        => data[0][:name],
# #         :wait_time   => wait_time_values[(data[0][:wait_time].to_i) - 1],
# #         :update      => data[0][:updated_at]
# #       }
# #     end
# #   end
# #   output.cycle do |o|
# #     Dashing.send_event('waittime', {
# #       title: airport_name,
# #       checkpoint: o[:name],
# #       waittime: o[:wait_time],
# #       info: o[:update].strftime("Last TSA update: %m/%d/%Y at %I:%M%p")
# #       })
# #   end
# #     sleep(30/output.size)
# # end
# city = "LAX"
# @airport = Airport.find(city)
# date = "4/10/2015".to_date
# @operation = @airport.operations.new(date: date)
# departure_list = []
# departure_schedule = []
# arrival_list = []
# arrival_schedule = []
# turns_arr = []
# ac_list_arr = []

# Flight.where(origin: @airport.code).each do |x|
#   FlightSchedule.where(flight_number: x).where("start_date < ? AND end_date > ?", date, date).each do |departure|
#     departure_list.push(x)
#     departure_schedule.push(departure)
#   end
# end

# Flight.where(destination: @airport.code).each do |x|
#   FlightSchedule.where(flight_number: x).where("start_date < ? AND end_date > ?", date, date).each do |arrival|
#     arrival_list.push(x)
#     arrival_schedule.push(arrival)
#   end
# end

# arrival_schedule.each do |arrival|
#   plane_list = Airplane.where(ac_type: arrival.ac_type)
#   ac_list_arr.push(plane_list)
# end

# arrival_list.count.times do |x|
#   turn_item = Hash.new
#   turn_item["departure"] = departure_list[x]
#   turn_item["departure_sked"] = departure_schedule[x]
#   turn_item["arrival"] = arrival_list[x]
#   turn_item["arrival_sked"] = arrival_schedule[x],
#   turn_item["aircraft_options"] = ac_list_arr[x]
#   turns_arr.push(turn_item)
# end

# turns_arr.each do |x|
#   @turn = @operation.turns.new
#   @turn.airport = @operation.airport
#   @turn.save
#   @departure = (@turn.departure = Departure.new)
#   @arrival = (@turn.arrival = Arrival.new)
#   @departure.flight = x['departure']
#   @arrival.flight = x['arrival']
#   @departure.save
#   @arrival.save
# end
