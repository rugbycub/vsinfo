 class Dashing.Departure extends Dashing.Widget
  
#   @accessor 'value_j', 'value_w', 'value_y', 'value_total', Dashing.AnimatedValue
#   constructor: ->
#     super



#     @observe 'value_j', (value) ->
#       $(@node).find(".meter_j").val(value).trigger('change')

#     @observe 'value_w', (value) ->
#       $(@node).find(".meter_w").val(value).trigger('change')      

#     @observe 'value_y', (value) ->
#       $(@node).find(".meter_y").val(value).trigger('change')      

#     @observe 'value_total', (value) ->
#       $(@node).find(".meter_total").val(value).trigger('change')
      


#     @observe 'thresholds_j', (thresholds) ->
#       console.log(thresholds)
#       cw = thresholds.warning
#       os = thresholds.oversold
#       @observe 'value_j', (value) ->
#         meter_j = $(@node).find(".meter_j")
#         if value > os
#           color = "red"
#         else if value > cw
#           color = "yellow"
#         else
#           color = "green"
#         meter_j.val(value).trigger('configure', fgColor: color)

#     @observe 'thresholds_w', (thresholds) ->
#       console.log(thresholds)
#       cw = thresholds.warning
#       os = thresholds.oversold
#       @observe 'value_w', (value) ->
#         meter_w = $(@node).find(".meter_w")
#         if value > os
#           color = "red"
#         else if value > cw
#           color = "yellow"
#         else
#           color = "green"
#         meter_w.val(value).trigger('configure', fgColor: color)

#     @observe 'thresholds_y', (thresholds) ->
#       console.log(thresholds)
#       cw = thresholds.warning
#       os = thresholds.oversold
#       @observe 'value_y', (value) ->
#         meter_y = $(@node).find(".meter_y")
#         if value > os
#           color = "red"
#         else if value > cw
#           color = "yellow"
#         else
#           color = "green"
#         meter_y.val(value).trigger('configure', fgColor: color)

#     @observe 'thresholds_total', (thresholds) ->
#       console.log(thresholds)
#       cw = thresholds.warning
#       os = thresholds.oversold
#       @observe 'value_total', (value) ->
#         meter_total = $(@node).find(".meter_total")
#         if value > os
#           color = "red"
#         else if value > cw
#           color = "yellow"
#         else
#           color = "green"
#         meter_total.val(value).trigger('configure', fgColor: color)

#     @observe 'max', (max) ->
#       $(@node).find(".meter_j").trigger('configure', 'max': max)

#     @observe 'max', (max) ->
#       $(@node).find(".meter_w").trigger('configure', 'max': max)

#     @observe 'max', (max) ->
#       $(@node).find(".meter_y").trigger('configure', 'max': max)

#     @observe 'max', (max) ->
#       $(@node).find(".meter_total").trigger('configure', 'max': max)

#   ready: ->
#     meter_j = $(@node).find(".meter_j")
#     meter_j.attr("data-bgcolor", meter.css("background-color"))
#     meter_j.attr("data-fgcolor", meter.css("color_j"))
#     meter_j.knob()

#     meter_w = $(@node).find(".meter_w")
#     meter_w.attr("data-bgcolor", meter.css("background-color"))
#     meter_w.attr("data-fgcolor", meter.css("color_w"))
#     meter_w.knob()

#     meter_y = $(@node).find(".meter_y")
#     meter_y.attr("data-bgcolor", meter.css("background-color"))
#     meter_y.attr("data-fgcolor", meter.css("color_y"))
#     meter_y.knob()

#     meter_total = $(@node).find(".meter_total")
#     meter_total.attr("data-bgcolor", meter.css("background-color"))
#     meter_total.attr("data-fgcolor", meter.css("color_total"))
#     meter_total.knob()
