class Sloth.Selector
  @ghost: $("<div class=\"selector-ghost\" />")
  @wrap: $("<div class=\"selector-wrap\" />")

  @calculateCorners: (x, y) ->
    start_x: Math.min(@start.x, x)
    start_y: Math.min(@start.y, y)
    end_x: Math.max(@start.x, x)
    end_y: Math.max(@start.y, y)

  @mouseDown: (event) =>
    @start =
      x: event.offsetX
      y: event.offsetY

    @createGhost()
    event.preventDefault()

  @mouseUp: (event) =>
    corners = @calculateCorners(event.offsetX, event.offsetY)
    selection =
      top: corners.start_y
      left: corners.start_x
      height: corners.end_y - corners.start_y
      width: corners.end_x - corners.start_x

    @onComplete selection
    @start = undefined

  @mouseMove: (event) =>
    if @start
      corners = @calculateCorners(event.offsetX, event.offsetY)

  @createGhost: ->

  @updateGhost: ->

  @destroyGhost: ->

  @init: (selector, callback) ->
    @selector = selector
    @onComplete = callback
    $(selector).on "mousedown", @mouseDown
    $(selector).on "mouseup", @mouseUp
    $(selector).on "mousemove", @mouseMove
