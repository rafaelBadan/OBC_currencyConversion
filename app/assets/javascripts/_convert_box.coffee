$(document).ready ->
  $('#amount').on change: ->
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

  #$('#swap').click: ->
    # curr_dest = $('#currency_destination').val();
      alert "teste"
  #   curr = $("#currency").val();
  #   $("#currency").val(curr_dest);
  #   $('#currency_destination').val(curr);
