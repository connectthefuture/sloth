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

  window.page = new Page