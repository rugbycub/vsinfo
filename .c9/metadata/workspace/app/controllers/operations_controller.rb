{"filter":false,"title":"operations_controller.rb","tooltip":"/app/controllers/operations_controller.rb","undoManager":{"mark":36,"position":36,"stack":[[{"group":"doc","deltas":[{"start":{"row":15,"column":4},"end":{"row":16,"column":28},"action":"remove","lines":["@operation = Operation.new","    respond_with(@operation)"]},{"start":{"row":15,"column":4},"end":{"row":67,"column":2},"action":"insert","lines":["city = \"LAX\"","@airport = Airport.find(city)","date = \"4/10/2015\".to_date","@operation = @airport.operations.new(date: date)","departure_list = []","departure_schedule = []","arrival_list = []","arrival_schedule = []","turns_arr = []","ac_list_arr = []","","Flight.where(origin: @airport.code).each do |x|","  FlightSchedule.where(flight_number: x).where(\"start_date < ? AND end_date > ?\", date, date).each do |departure|","    departure_list.push(x)","    departure_schedule.push(departure)","  end","end","","Flight.where(destination: @airport.code).each do |x|","  FlightSchedule.where(flight_number: x).where(\"start_date < ? AND end_date > ?\", date, date).each do |arrival| ","    arrival_list.push(x)","    arrival_schedule.push(arrival)","  end","end","","arrival_schedule.each do |arrival|","  plane_list = Airplane.where(ac_type: arrival.ac_type)","  ac_list_arr.push(plane_list)","end","","arrival_list.count.times do |x|","  turn_item = Hash.new","  turn_item[\"departure\"] = departure_list[x]","  turn_item[\"departure_sked\"] = departure_schedule[x]","  turn_item[\"arrival\"] = arrival_list[x]","  turn_item[\"arrival_sked\"] = arrival_schedule[x],","  turn_item[\"aircraft_options\"] = ac_list_arr[x]","  turns_arr.push(turn_item)","end","","turns_arr.each do |x|","  @turn = @operation.turns.new","  @turn.airport = @operation.airport","  @turn.save","  @departure = (@turn.departure = Departure.new)","  @arrival = (@turn.arrival = Arrival.new)","  @departure.flight = x['departure']","  @arival.flight = x['arrival']","  @departure.save","  @arrival.save","end","  ","  "]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":15},"end":{"row":15,"column":16},"action":"remove","lines":["\""]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":14},"end":{"row":15,"column":15},"action":"remove","lines":["X"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":13},"end":{"row":15,"column":14},"action":"remove","lines":["A"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":12},"end":{"row":15,"column":13},"action":"remove","lines":["L"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":11},"end":{"row":15,"column":12},"action":"remove","lines":["\""]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":11},"end":{"row":15,"column":12},"action":"insert","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":12},"end":{"row":15,"column":13},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":13},"end":{"row":15,"column":14},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":14},"end":{"row":15,"column":15},"action":"insert","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":14},"end":{"row":15,"column":15},"action":"remove","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":13},"end":{"row":15,"column":14},"action":"remove","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":13},"end":{"row":15,"column":14},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":14},"end":{"row":15,"column":15},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":15},"end":{"row":15,"column":16},"action":"insert","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":16},"end":{"row":15,"column":17},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":17},"end":{"row":15,"column":19},"action":"insert","lines":["()"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":18},"end":{"row":15,"column":19},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":19},"end":{"row":15,"column":20},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":20},"end":{"row":15,"column":21},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":21},"end":{"row":15,"column":22},"action":"insert","lines":["y"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":18},"end":{"row":15,"column":19},"action":"insert","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":56,"column":2},"end":{"row":56,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":2},"end":{"row":57,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":58,"column":2},"end":{"row":58,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":2},"end":{"row":59,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":60,"column":2},"end":{"row":60,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":61,"column":2},"end":{"row":61,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":62,"column":2},"end":{"row":62,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":63,"column":2},"end":{"row":63,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":64,"column":2},"end":{"row":64,"column":3},"action":"remove","lines":["@"]}]}],[{"group":"doc","deltas":[{"start":{"row":16,"column":0},"end":{"row":16,"column":2},"action":"insert","lines":["  "]},{"start":{"row":17,"column":0},"end":{"row":17,"column":2},"action":"insert","lines":["  "]},{"start":{"row":18,"column":0},"end":{"row":18,"column":2},"action":"insert","lines":["  "]},{"start":{"row":19,"column":0},"end":{"row":19,"column":2},"action":"insert","lines":["  "]},{"start":{"row":20,"column":0},"end":{"row":20,"column":2},"action":"insert","lines":["  "]},{"start":{"row":21,"column":0},"end":{"row":21,"column":2},"action":"insert","lines":["  "]},{"start":{"row":22,"column":0},"end":{"row":22,"column":2},"action":"insert","lines":["  "]},{"start":{"row":23,"column":0},"end":{"row":23,"column":2},"action":"insert","lines":["  "]},{"start":{"row":24,"column":0},"end":{"row":24,"column":2},"action":"insert","lines":["  "]},{"start":{"row":25,"column":0},"end":{"row":25,"column":2},"action":"insert","lines":["  "]},{"start":{"row":26,"column":0},"end":{"row":26,"column":2},"action":"insert","lines":["  "]},{"start":{"row":27,"column":0},"end":{"row":27,"column":2},"action":"insert","lines":["  "]},{"start":{"row":28,"column":0},"end":{"row":28,"column":2},"action":"insert","lines":["  "]},{"start":{"row":29,"column":0},"end":{"row":29,"column":2},"action":"insert","lines":["  "]},{"start":{"row":30,"column":0},"end":{"row":30,"column":2},"action":"insert","lines":["  "]},{"start":{"row":31,"column":0},"end":{"row":31,"column":2},"action":"insert","lines":["  "]},{"start":{"row":32,"column":0},"end":{"row":32,"column":2},"action":"insert","lines":["  "]},{"start":{"row":33,"column":0},"end":{"row":33,"column":2},"action":"insert","lines":["  "]},{"start":{"row":34,"column":0},"end":{"row":34,"column":2},"action":"insert","lines":["  "]},{"start":{"row":35,"column":0},"end":{"row":35,"column":2},"action":"insert","lines":["  "]},{"start":{"row":36,"column":0},"end":{"row":36,"column":2},"action":"insert","lines":["  "]},{"start":{"row":37,"column":0},"end":{"row":37,"column":2},"action":"insert","lines":["  "]},{"start":{"row":38,"column":0},"end":{"row":38,"column":2},"action":"insert","lines":["  "]},{"start":{"row":39,"column":0},"end":{"row":39,"column":2},"action":"insert","lines":["  "]},{"start":{"row":40,"column":0},"end":{"row":40,"column":2},"action":"insert","lines":["  "]},{"start":{"row":41,"column":0},"end":{"row":41,"column":2},"action":"insert","lines":["  "]},{"start":{"row":42,"column":0},"end":{"row":42,"column":2},"action":"insert","lines":["  "]},{"start":{"row":43,"column":0},"end":{"row":43,"column":2},"action":"insert","lines":["  "]},{"start":{"row":44,"column":0},"end":{"row":44,"column":2},"action":"insert","lines":["  "]},{"start":{"row":45,"column":0},"end":{"row":45,"column":2},"action":"insert","lines":["  "]},{"start":{"row":46,"column":0},"end":{"row":46,"column":2},"action":"insert","lines":["  "]},{"start":{"row":47,"column":0},"end":{"row":47,"column":2},"action":"insert","lines":["  "]},{"start":{"row":48,"column":0},"end":{"row":48,"column":2},"action":"insert","lines":["  "]},{"start":{"row":49,"column":0},"end":{"row":49,"column":2},"action":"insert","lines":["  "]},{"start":{"row":50,"column":0},"end":{"row":50,"column":2},"action":"insert","lines":["  "]},{"start":{"row":51,"column":0},"end":{"row":51,"column":2},"action":"insert","lines":["  "]},{"start":{"row":52,"column":0},"end":{"row":52,"column":2},"action":"insert","lines":["  "]},{"start":{"row":53,"column":0},"end":{"row":53,"column":2},"action":"insert","lines":["  "]},{"start":{"row":54,"column":0},"end":{"row":54,"column":2},"action":"insert","lines":["  "]},{"start":{"row":55,"column":0},"end":{"row":55,"column":2},"action":"insert","lines":["  "]},{"start":{"row":56,"column":0},"end":{"row":56,"column":2},"action":"insert","lines":["  "]},{"start":{"row":57,"column":0},"end":{"row":57,"column":2},"action":"insert","lines":["  "]},{"start":{"row":58,"column":0},"end":{"row":58,"column":2},"action":"insert","lines":["  "]},{"start":{"row":59,"column":0},"end":{"row":59,"column":2},"action":"insert","lines":["  "]},{"start":{"row":60,"column":0},"end":{"row":60,"column":2},"action":"insert","lines":["  "]},{"start":{"row":61,"column":0},"end":{"row":61,"column":2},"action":"insert","lines":["  "]},{"start":{"row":62,"column":0},"end":{"row":62,"column":2},"action":"insert","lines":["  "]},{"start":{"row":63,"column":0},"end":{"row":63,"column":2},"action":"insert","lines":["  "]},{"start":{"row":64,"column":0},"end":{"row":64,"column":2},"action":"insert","lines":["  "]},{"start":{"row":65,"column":0},"end":{"row":65,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":16,"column":0},"end":{"row":16,"column":2},"action":"insert","lines":["  "]},{"start":{"row":17,"column":0},"end":{"row":17,"column":2},"action":"insert","lines":["  "]},{"start":{"row":18,"column":0},"end":{"row":18,"column":2},"action":"insert","lines":["  "]},{"start":{"row":19,"column":0},"end":{"row":19,"column":2},"action":"insert","lines":["  "]},{"start":{"row":20,"column":0},"end":{"row":20,"column":2},"action":"insert","lines":["  "]},{"start":{"row":21,"column":0},"end":{"row":21,"column":2},"action":"insert","lines":["  "]},{"start":{"row":22,"column":0},"end":{"row":22,"column":2},"action":"insert","lines":["  "]},{"start":{"row":23,"column":0},"end":{"row":23,"column":2},"action":"insert","lines":["  "]},{"start":{"row":24,"column":0},"end":{"row":24,"column":2},"action":"insert","lines":["  "]},{"start":{"row":25,"column":0},"end":{"row":25,"column":2},"action":"insert","lines":["  "]},{"start":{"row":26,"column":0},"end":{"row":26,"column":2},"action":"insert","lines":["  "]},{"start":{"row":27,"column":0},"end":{"row":27,"column":2},"action":"insert","lines":["  "]},{"start":{"row":28,"column":0},"end":{"row":28,"column":2},"action":"insert","lines":["  "]},{"start":{"row":29,"column":0},"end":{"row":29,"column":2},"action":"insert","lines":["  "]},{"start":{"row":30,"column":0},"end":{"row":30,"column":2},"action":"insert","lines":["  "]},{"start":{"row":31,"column":0},"end":{"row":31,"column":2},"action":"insert","lines":["  "]},{"start":{"row":32,"column":0},"end":{"row":32,"column":2},"action":"insert","lines":["  "]},{"start":{"row":33,"column":0},"end":{"row":33,"column":2},"action":"insert","lines":["  "]},{"start":{"row":34,"column":0},"end":{"row":34,"column":2},"action":"insert","lines":["  "]},{"start":{"row":35,"column":0},"end":{"row":35,"column":2},"action":"insert","lines":["  "]},{"start":{"row":36,"column":0},"end":{"row":36,"column":2},"action":"insert","lines":["  "]},{"start":{"row":37,"column":0},"end":{"row":37,"column":2},"action":"insert","lines":["  "]},{"start":{"row":38,"column":0},"end":{"row":38,"column":2},"action":"insert","lines":["  "]},{"start":{"row":39,"column":0},"end":{"row":39,"column":2},"action":"insert","lines":["  "]},{"start":{"row":40,"column":0},"end":{"row":40,"column":2},"action":"insert","lines":["  "]},{"start":{"row":41,"column":0},"end":{"row":41,"column":2},"action":"insert","lines":["  "]},{"start":{"row":42,"column":0},"end":{"row":42,"column":2},"action":"insert","lines":["  "]},{"start":{"row":43,"column":0},"end":{"row":43,"column":2},"action":"insert","lines":["  "]},{"start":{"row":44,"column":0},"end":{"row":44,"column":2},"action":"insert","lines":["  "]},{"start":{"row":45,"column":0},"end":{"row":45,"column":2},"action":"insert","lines":["  "]},{"start":{"row":46,"column":0},"end":{"row":46,"column":2},"action":"insert","lines":["  "]},{"start":{"row":47,"column":0},"end":{"row":47,"column":2},"action":"insert","lines":["  "]},{"start":{"row":48,"column":0},"end":{"row":48,"column":2},"action":"insert","lines":["  "]},{"start":{"row":49,"column":0},"end":{"row":49,"column":2},"action":"insert","lines":["  "]},{"start":{"row":50,"column":0},"end":{"row":50,"column":2},"action":"insert","lines":["  "]},{"start":{"row":51,"column":0},"end":{"row":51,"column":2},"action":"insert","lines":["  "]},{"start":{"row":52,"column":0},"end":{"row":52,"column":2},"action":"insert","lines":["  "]},{"start":{"row":53,"column":0},"end":{"row":53,"column":2},"action":"insert","lines":["  "]},{"start":{"row":54,"column":0},"end":{"row":54,"column":2},"action":"insert","lines":["  "]},{"start":{"row":55,"column":0},"end":{"row":55,"column":2},"action":"insert","lines":["  "]},{"start":{"row":56,"column":0},"end":{"row":56,"column":2},"action":"insert","lines":["  "]},{"start":{"row":57,"column":0},"end":{"row":57,"column":2},"action":"insert","lines":["  "]},{"start":{"row":58,"column":0},"end":{"row":58,"column":2},"action":"insert","lines":["  "]},{"start":{"row":59,"column":0},"end":{"row":59,"column":2},"action":"insert","lines":["  "]},{"start":{"row":60,"column":0},"end":{"row":60,"column":2},"action":"insert","lines":["  "]},{"start":{"row":61,"column":0},"end":{"row":61,"column":2},"action":"insert","lines":["  "]},{"start":{"row":62,"column":0},"end":{"row":62,"column":2},"action":"insert","lines":["  "]},{"start":{"row":63,"column":0},"end":{"row":63,"column":2},"action":"insert","lines":["  "]},{"start":{"row":64,"column":0},"end":{"row":64,"column":2},"action":"insert","lines":["  "]},{"start":{"row":65,"column":0},"end":{"row":65,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":67,"column":0},"end":{"row":67,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":66,"column":2},"end":{"row":67,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":66,"column":0},"end":{"row":66,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":7},"end":{"row":66,"column":0},"action":"remove","lines":["",""]}]}]]},"ace":{"folds":[],"scrolltop":290.5,"scrollleft":0,"selection":{"start":{"row":65,"column":7},"end":{"row":65,"column":7},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":16,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1421145726000,"hash":"33092982959b26c7698dd9cfe072bafdb6608366"}