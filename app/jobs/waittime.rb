# require 'HTTParty'
# require 'json' 
# require 'crack'
# require 'pry'

# airport_code = 'LAX'

# wait_time_values = ["No Wait", "1-10 minutes", "11-20 minutes", "21-30 minutes", "31+ minutes"]
# airports_resource = 'http://www.tsa.gov/data/apcp.xml'
# airport_checkpoint_resource = 'http://apps.tsa.dhs.gov/MyTSAWebService/GetWaitTimes.ashx'
# airport_name = airport_code


# Dashing.scheduler.every '5m', first_in: 1.second.since do |job|
#   airport_checkpoint_waittimes = []
#   output = []  
#   airports_resource_response = HTTParty.get(airports_resource)

#   airports_resource_xml = Crack::XML.parse(airports_resource_response.body)
#   airports_resource_json = Crack::JSON.parse(airports_resource_xml.to_json)

#   airports_resource_json['airports']['airport'].each do |airport|
#     if airport['shortcode'] == airport_code.upcase
#       airport_name = airport['name']

#       # Stupidness in JSON convesion.. SHould always be array        
#       if !airport['checkpoints']['checkpoint'].kind_of?(Array)
#         airport['checkpoints']['checkpoint'] = [airport['checkpoints']['checkpoint']]
#       end

#       # Airport Checkpoints
#       airport['checkpoints']['checkpoint'].each do |checkpoint|
#          #puts "Getting Checkpoints"
#          #puts "Checkpoint Id: " + checkpoint['id']
#          #puts "Checkpoint Name: " + checkpoint['longname']

#          airport_checkpoint_resouce_response = HTTParty.get(airport_checkpoint_resource, { :query => { :ap => airport_code, :output => 'json'} })
#          airport_checkpoint_resouce_json = JSON.parse(airport_checkpoint_resouce_response.body)

#          airport_checkpoint_resouce_json['WaitTimes'].each do |waittime|        
#           if waittime['CheckpointIndex'] == checkpoint['id']
#             #puts "Wait Time " + waittime['WaitTimeIndex'] + " minutes"
#             #puts "Updated: " + waittime["Created_Datetime"] #9/2/2013 2:24:33 AM
#             # 
#             checkpoint_last_updated_at = DateTime.strptime(waittime["Created_Datetime"], '%m/%d/%Y %H:%M:%S %p')
            
            
#               # puts waittime["Created_Datetime"] + " Is TODAY!"
#               airport_checkpoint_waittimes << {
#                 :id        => checkpoint["id"], 
#                 :name       => checkpoint["longname"],
#                 :wait_time  => waittime['WaitTimeIndex'],
#                 :updated_at => checkpoint_last_updated_at
#               }
#             end
#           end
        
#       end
#     end
#   end

#   # Create groups of checkpoints
#   groups = Hash.new{|h,k| h[k] = [] }
#   airport_checkpoint_waittimes.each {|checkpoint| groups[checkpoint[:id]] << checkpoint }

#   # parse checkpoints into new hash
#   groups.each do |group, data|
#     data.sort_by!{ |c| c[:updated_at].to_s.to_i}
#     if data.size > 1

#       output << { 
#         :id          => data[0][:id],
#         :name        => data[0][:name],
#         :wait_time   => wait_time_values[(data[0][:wait_time].to_i) - 1],
#         :update      => data[0][:updated_at]
#       }
#     else 
#       output << { 
#         :id         => data[0][:id],
#         :name        => data[0][:name],
#         :wait_time   => wait_time_values[(data[0][:wait_time].to_i) - 1],
#         :update      => data[0][:updated_at]
#       }
#     end
#   end
#   output.cycle do |o|
#     Dashing.send_event('waittime', { 
#       title: airport_name,
#       checkpoint: o[:name],
#       waittime: o[:wait_time],
#       info: o[:update].strftime("Last TSA update: %m/%d/%Y at %I:%M%p")
#       })
#   end
#     sleep(30/output.size)
# end