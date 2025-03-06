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
//= require bankpd.js
// require categorypd.js
//= require payline.js
// require accountype.js
// require accountno.js
//= require receipt_lines.js
// require bank_form.js
//= require receipts.js
// require Chart.js
// require invoice_lines.js







document.addEventListener("DOMContentLoaded", function() {
  const addReceipt_lineButton = document.getElementById('add_receipt_line');
  const receipt_linesTable = document.getElementById('receipt_lines').getElementsByTagName('tbody')[0];

  addReceipt_lineButton.addEventListener('click', function(e) {
    e.preventDefault();

    const time = new Date().getTime();
    const regex = new RegExp('new_receipt_lines', 'g');

    const newRow = document.createElement('tr');
    newRow.innerHTML = document.getElementById('receipt_lines_template').innerHTML.replace(regex, time);

    receipt_linesTable.appendChild(newRow);
  });
});

// app/assets/javascripts/application.js
$(document).ready(function() {
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
});


document.addEventListener('DOMContentLoaded', () => {
  const addLineButton = document.getElementById('add-receipt-line');
  const receiptLinesTable = document.querySelector('#receipt-lines tbody');

  addLineButton.addEventListener('click', (e) => {
    e.preventDefault();

    const newId = new Date().getTime();
    const regex = new RegExp('new_receipt_lines', 'g');
    const newRow = document
      .getElementById('receipt-line-template')
      .innerHTML.replace(regex, newId);

    receiptLinesTable.insertAdjacentHTML('beforeend', newRow);
  });

  receiptLinesTable.addEventListener('click', (e) => {
    if (e.target.classList.contains('remove-receipt-line')) {
      e.preventDefault();
      e.target.closest('tr').remove();
    }
  });
});




document.addEventListener('DOMContentLoaded', () => {
  const addLineButton = document.getElementById('add-receipt-line');
  const receiptLinesTable = document.getElementById('receipt-lines').querySelector('tbody');

  addLineButton.addEventListener('click', (e) => {
    e.preventDefault();
    const newId = new Date().getTime();
    const template = document.getElementById('new-receipt-line-template').innerHTML.replace(/NEW_RECEIPT_LINE/g, newId);
    receiptLinesTable.insertAdjacentHTML('beforeend', template);
  });

  receiptLinesTable.addEventListener('click', (e) => {
    if (e.target.classList.contains('remove-receipt-line')) {
      e.preventDefault();
      e.target.closest('tr').remove();
    }
  });
});




// Add Invoice Line
document.addEventListener('DOMContentLoaded', function () {
  const addButton = document.getElementById('add_invoice_line');
  const invoiceLinesContainer = document.getElementById('invoice_lines');

  if (addButton && invoiceLinesContainer) {
    addButton.addEventListener('click', function () {
      const newFields = document.createElement('div');
      newFields.innerHTML = `
        
        <tr class="invoice_line">
      
            <td><input type="text" name="invoice[invoice_lines_attributes][NEW_RECORD][charge_type]" id="invoice_invoice_lines_attributes_NEW_RECORD_charge_type" </td>
         
             <td><input type="text" name="invoice[invoice_lines_attributes][NEW_RECORD][item_no]" id="invoice_invoice_lines_attributes_NEW_RECORD_item_no" </td>
        
            <td><input type="text" name="invoice[invoice_lines_attributes][NEW_RECORD][description]" id="invoice_invoice_lines_attributes_NEW_RECORD_description" </td>
        
           <td>
            <input type="number" name="invoice[invoice_lines_attributes][NEW_RECORD][quantity]" id="invoice_invoice_lines_attributes_NEW_RECORD_quantity" step="any" </td>
         
           <td> <input type="text" name="invoice[invoice_lines_attributes][NEW_RECORD][unit_of_measure]" id="invoice_invoice_lines_attributes_NEW_RECORD_unit_of_measure" </td>
          
            <td><input type="number" name="invoice[invoice_lines_attributes][NEW_RECORD][unit_price]" id="invoice_invoice_lines_attributes_NEW_RECORD_unit_price" step="any" </td>
        
            <td><input type="number" name="invoice[invoice_lines_attributes][NEW_RECORD][amount]" id="invoice_invoice_lines_attributes_NEW_RECORD_amount" step="any" </td>
            
            </tr>
          

          <button type="button" class="remove_invoice_line btn btn-danger">Remove Line</button>
   
      `;

      // Replace NEW_RECORD with a unique timestamp
      const timestamp = new Date().getTime();
      newFields.innerHTML = newFields.innerHTML.replace(/NEW_RECORD/g, timestamp);

      invoiceLinesContainer.appendChild(newFields);
    });

    // Remove Invoice Line
    invoiceLinesContainer.addEventListener('click', function (event) {
      if (event.target.classList.contains('remove_invoice_line')) {
        event.target.closest('.nested-fields').remove();
      }
    });
  }
});









