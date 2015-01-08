# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#
jQuery ->
  $("input[id$=user_name]").on 'focusin', '', (event) ->
    $(this).css
      "color": "#0088CC"
      "background": "lightblue"


