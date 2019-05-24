# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#emoji-tags').tagit
    fieldName:   'category_list'
    singleField: true
  $('#emoji-tags').tagit()
  category_string = $("#category_hidden").val()
  try
    category_list = category_string.split(',')
    for tag in category_list
      $('#emoji-tags').tagit 'createTag', tag
  catch error
