class Dashing.Departure extends Dashing.Widget

  @accessor 'j_value', Dashing.AnimatedValue
  @accessor 'w_value', Dashing.AnimatedValue
  @accessor 'y_value', Dashing.AnimatedValue
  @accessor 'total_value', Dashing.AnimatedValue
  @accessor 'max'

  # constructor: ->
  #   super
  #   @observe 'j_value', (j_value) ->
  #     $(@node).find("#j_booked_meter").val(j_value).trigger('change')
  #     console.log($(@node).find("#j_booked_meter"))
    
  #   @observe 'w_value', (w_value) ->
  #     $(@node).find("#w_booked_meter").val(w_value).trigger('change')
  #     console.log($(@node).find("#w_booked_meter"))

  #   @observe 'y_value', (y_value) ->
  #     $(@node).find("#y_booked_meter").val(y_value).trigger('change')
  #     console.log($(@node).find("#y_booked_meter"))

  #   @observe 'total_value', (total_value) ->
  #     $(@node).find("#total_booked_meter").val(total_value).trigger('change')
  #     console.log($(@node).find("#total_booked_meter"))

  ready: ->
    @observe 'j_value', (j_value) ->
      j_meter = $(@node).find("#j_booked_meter")
      max = parseInt($(@node).find("#j_booked_meter").attr("data-max")) + 5
      if j_value > j_meter.attr("data-j_capacity")
        j_color = "red"
      else if j_value > j_meter.attr("data-j_capacity") - 5 
        j_color = "yellow"
      else
        j_color = "green"
      j_meter.attr("data-bgcolor", j_meter.css("background-color"))
      j_meter.val(j_value).trigger('configure', fgColor: j_color)
      j_meter.attr("data-max", max )
      j_meter.knob()
      j_meter.val(j_value).trigger('change')

    @observe 'w_value', (w_value) ->
      w_meter = $(@node).find("#w_booked_meter")
      max = parseInt($(@node).find("#w_booked_meter").attr("data-max")) + 10
      if w_value > w_meter.attr("data-w_capacity")
        w_color = "red"
      else if w_value > w_meter.attr("data-w_capacity") - 5 
        w_color = "yellow"
      else
        w_color = "green"
      w_meter.attr("data-bgcolor", w_meter.css("background-color"))
      w_meter.val(w_value).trigger('configure', fgColor: w_color)
      w_meter.attr("data-max", max )
      w_meter.knob()
      w_meter.val(w_value).trigger('change')

    @observe 'y_value', (y_value) ->
      y_meter = $(@node).find("#y_booked_meter")
      max = parseInt($(@node).find("#y_booked_meter").attr("data-max")) + 20
      if y_value > y_meter.attr("data-y_capacity")
        y_color = "red"
      else if y_value > y_meter.attr("data-y_capacity") - 15 
        y_color = "yellow"
      else
        y_color = "green"
      y_meter.attr("data-bgcolor", y_meter.css("background-color"))
      y_meter.val(y_value).trigger('configure', fgColor: y_color)
      y_meter.attr("data-max", max )
      y_meter.knob()
      y_meter.val(y_value).trigger('change')

    @observe 'total_value', (total_value) ->
      total_meter = $(@node).find("#total_booked_meter")
      max = parseInt($(@node).find("#total_booked_meter").attr("data-max")) + 25
      if total_value > total_meter.attr("data-total_capacity")
        total_color = "red"
      else if total_value > total_meter.attr("data-total_capacity") - 10 
        total_color = "yellow"
      else
        total_color = "green"
      total_meter.attr("data-bgcolor", total_meter.css("background-color"))
      total_meter.val(total_value).trigger('configure', fgColor: total_color)
      total_meter.attr("data-max", max )
      total_meter.knob()
      total_meter.val(total_value).trigger('change')