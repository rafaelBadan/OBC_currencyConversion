$(document).ready ->
  $("#amount, #currency, #currency_destination").on "change keyup input": ->
      convert();

  $('#swap_currencies').click ->
      swap();



convert = () ->
  if $('form').attr('action') == '/convert'
    $.ajax '/convert',
        type: 'POST'
        dataType: 'json'
        data: {
                currency: $("#currency").val(),
                currency_destination: $("#currency_destination").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;

swap = () ->
   base_curr = $("#currency").val();
   $("#currency").val($('#currency_destination').val());
   $('#currency_destination').val(base_curr);
   convert();
