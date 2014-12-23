# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  step2() unless $('.guest_status input:checked').val() == undefined
  step3() unless $('.guest_name input').val() == ''
  $('.guest_status input:radio').on 'change', step2

step2 = ->
  $('.guest_name').removeClass('disabled')
  $('.guest_status').addClass('disabled')
  $('.guest_name input').removeAttr("disabled")
  $('.guest_name input').focus()
  $('input[type=submit]').val('Next / Volgende')
  $('input[type=submit]').show()
  $('input[type=submit]').on 'click', step3

step3 = ->
  submit = $('.guest_status input:checked').val() == 'cancelled'
  if submit
    return true
  else
    $('.guest_name').hide()
    $('.guest_email').removeClass('disabled')
    $('.guest_email input').removeAttr("disabled")
    $('.guest_email input').focus()
    $('input[type=submit]').unbind('click')
    $('input[type=submit]').on 'click', step4
    return false

step4 = ->
  $('.guest_email').hide()
  $('.guest_plus_one').removeClass('disabled')
  $('.guest_plus_one input').removeAttr("disabled")
  $('input[type=submit]').unbind('click')
  $('input[type=submit]').hide()
  $('.guest_plus_one input:radio').on 'change', step5
  return false

step5 = ->
  submit = $('.guest_plus_one input:checked').val() == '0'
  if submit
    $('form').submit()
  else
    $('.guest_plus_one').hide()
    $('.guest_plus_one_name').removeClass('disabled')
    $('.guest_plus_one_name input').removeAttr("disabled")
    $('.guest_plus_one_name input').focus()
    $('input[type=submit]').unbind('click')
    $('input[type=submit]').show()
    return false
