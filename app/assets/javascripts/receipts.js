$(document).ready(function() {
  $('#bank_code_select').on('change', function() {
    var bankCode = $(this).val();

    if (bankCode) {
      $.ajax({
        url: '/receipts/fetch_bank_details', // Correct route
        method: 'GET',
        data: { bank_code: bankCode },
        dataType: 'json',
        success: function(data) {
          if (data.description) {
            $('#description_field').val(data.description).prop('disabled', false);
            $('#glaccount_field').val(data.glaccount).prop('disabled', false);
          } else {
            alert('Bank details not found');
          }
        },
        error: function(xhr, status, error) {
          alert('Error fetching bank details');
          console.error('AJAX Error:', status, error);
        }
      });
    } else {
      $('#description_field').val('').prop('disabled', true);
      $('#glaccount_field').val('').prop('disabled', true);
    }
  });
});


