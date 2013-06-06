$ ->
  class Page
    scope: $(".page")
    MODES: [ "view", "edit" ]
    current_mode: "view"

    constructor: ->
      console.log "Init page"

      @scope.find(".page_edit_mode").on("click", =>
        @load_edit_mode()
      )

      @scope.find(".page_view_mode").on("click", =>
        @load_view_mode()
      )

    load_edit_mode: ->
      console.log "Entering edit mode"
      @current_mode = "edit"

    load_view_mode: ->
      console.log "Entering view mode"
      @current_mode = "view"

    # TODO

    # ON LOAD VIEW MODE
    # Hide links CSSes (but keep them active)
    # Unload the Image Area Selection
    # Show image comments

    # ON LOAD EDIT MODE
    # Load the IMAGE AREA SELECTION lib
    # Hide image comments

  window.page = new Page