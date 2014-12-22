# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  step2() unless $('.guest_state input:checked').val() == undefined
  $('.guest_state input:radio').on 'change', step2

step2 = ->
  $('.guest_email').removeClass('disabled')
  $('.guest_state').addClass('disabled')
  $('.guest_email input').removeAttr("disabled")
