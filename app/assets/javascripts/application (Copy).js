// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require jquery/jquery-3.1.1.min.js
//= require popper
//= require bootstrap
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require metisMenu/jquery.metisMenu.js
//= require inspinia.js
// require bankpd.js
//= require categorypd.js
//= require paylinej.js



document.addEventListener("DOMContentLoaded", function() {
  const addPaymentlineButton = document.getElementById('add_paymentline');
  const paymentlinesTable = document.getElementById('paymentlines').getElementsByTagName('tbody')[0];

  // Function to add new paymentline row
  addPaymentlineButton.addEventListener('click', function(e) {
    e.preventDefault();

    // Get a unique timestamp to replace placeholders in the template
    const time = new Date().getTime();
    const regex = new RegExp('new_paymentlines', 'g');

    // Clone the hidden template row
    const newRow = document.createElement('tr');
    newRow.innerHTML = document.getElementById('paymentlines_template').innerHTML.replace(regex, time);
    
    // Append the new row to the table
    paymentlinesTable.appendChild(newRow);
  });

  // Function to remove paymentline row
  document.addEventListener('click', function(e) {
    if (e.target && e.target.matches('.remove_fields')) {
      e.preventDefault();
      const row = e.target.closest('tr');
      row.remove();
    }
  });
});

