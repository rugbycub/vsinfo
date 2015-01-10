class Dashing.Departure2 extends Dashing.Widget

  @accessor 'j_booked_percentage', Dashing.AnimatedValue
  @accessor 'w_booked_percentage', Dashing.AnimatedValue
  @accessor 'y_booked_percentage', Dashing.AnimatedValue
  @accessor 'total_booked_percentage', Dashing.AnimatedValue

  # constructor: ->
  #   $(@node).find(".meter").each (index, element) =>
  #     super
  #     @observe 'value', (value) ->
  #       

  ready: ->
    $(@node).find(".meter").each (index, element) =>
      console.log (element)
      console.log (index)
      meter = $(element)
      meter.val(meter.attr("value")).trigger "change"
      console.log (meter.attr("value"))
      meter.attr "data-bgcolor", "orange"  
      meter.attr "data-fgcolor", "blue"
      meter.attr "data-width", "100"
      meter.attr "data-height", "95"
      meter.attr "data-thickness", ".3"
      meter.attr "data-angleArc", "250"
      meter.attr "data-angleOffset", "-125"
      meter.attr "data-displayInput", "false"
      meter.attr "data-readOnly", "true"
      meter.knob()
      
      meter.val(meter.attr("value")).trigger "change"
