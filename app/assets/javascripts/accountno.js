$(document).on('change', '#account_type_select', function() {
  var account_type_id = $(this).val();
  
  // Ensure the account_type_id is selected
  if (account_type) {
    $.ajax({
      url: '/fetch_accountno',
      type: 'GET',
      dataType: 'json',
      data: { account_type: account_type },
      success: function(data) {
        // Populate the account_no field with the fetched data
        $('#accountno').val(data.account_no);
      },
      error: function(xhr, status, error) {
        console.log('Error fetching account no: ', error);
      }
    });
  } else {
    // Clear the account_no field if no account type is selected
    $('#accountno').val('');
  }
});




