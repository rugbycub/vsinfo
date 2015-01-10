console.log("Yeah! The dashboard has started!")

Dashing.on 'ready', ->
  Dashing.widget_margins ||= [7, 2]
  Dashing.widget_base_dimensions ||= [145, 119]
  Dashing.numColumns ||= 14

  contentWidth = (Dashing.widget_base_dimensions[0] + Dashing.widget_margins[0] * 2) * Dashing.numColumns
  if $(window).width() > 768
    Batman.setImmediate ->
      $('.gridster').width(contentWidth)
      $('.gridster ul:first').gridster
        widget_margins: Dashing.widget_margins
        widget_base_dimensions: Dashing.widget_base_dimensions
        avoid_overlapped_widgets: !Dashing.customGridsterLayout
        draggable:
          stop: Dashing.showGridsterInstructions
          start: -> Dashing.currentWidgetPositions = Dashing.getWidgetPositions()
   else       
    Batman.setImmediate ->
        $('.gridster').width(contentWidth)
        $('.gridster ul:first').gridster
          widget_margins: Dashing.widget_margins
          widget_base_dimensions: Dashing.widget_base_dimensions
          avoid_overlapped_widgets: !Dashing.customGridsterLayout
          draggable:
            stop: Dashing.showGridsterInstructions
            start: -> Dashing.currentWidgetPositions = Dashing.getWidgetPositions()