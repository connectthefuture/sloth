class Sloth.Selector
  @ghost: $("<div class='selector-ghost' style='display:none; position: absolute; border: 1px solid black;' />")
  @wrap:  $("<div class='selector-wrap' />")

  @calculateCorners: (x, y) ->
    start_x: Math.min(@start.x, x)
    start_y: Math.min(@start.y, y)
    end_x:   Math.max(@start.x, x)
    end_y:   Math.max(@start.y, y)

  @calculateBox: (corners) ->
    top: corners.start_y
    left: corners.start_x
    height: corners.end_y - corners.start_y
    width: corners.end_x - corners.start_x

  @mouseDown: (event) =>
    @start =
      x: event.offsetX
      y: event.offsetY

    @createGhost()
    event.preventDefault()

  @mouseUp: (event) =>
    corners   = @calculateCorners(event.offsetX, event.offsetY)
    selection = @calculateBox(corners)

    @onComplete(selection)
    @start = undefined

  @mouseMove: (event) =>
    if @start
      corners = @calculateCorners(event.offsetX, event.offsetY)
      box_pos = @calculateBox(corners)
      @updateGhostPost(box_pos)

  @createGhost: ->
    @ghost.show()

  @updateGhostPost: (pos) ->
    @ghost.css({top: pos.top, left: pos.left, height: pos.height, width: pos.width})

  @destroyGhost: ->

  @init: (selector, callback) ->
    @selector   = selector
    @onComplete = callback

    $(@selector).append @ghost

    $(selector).on "mousedown", @mouseDown
    $(selector).on "mouseup", @mouseUp
    $(selector).on "mousemove", @mouseMove
