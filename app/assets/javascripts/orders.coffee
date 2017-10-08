# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  berths = $('#order_city_id').html()
  $('#order_city_id').prop('disabled': true)
  $('#order_pay_type').prop('disabled': true)
  
  $('#order_province_id').change ->
    port = $('#order_province_id :selected').text()
    options = $(berths).filter("optgroup[label='#{port}']").html()
    console.log(options)
    if options
      $('#order_city_id').html(options)
      $('#order_city_id').prop('disabled': false)
      $('#order_pay_type').prop('disabled': false)
    else
      $('#order_city_id').empty()
      $('#order_city_id').prop('disabled': true)
      $('#order_pay_type').prop('disabled': true)

