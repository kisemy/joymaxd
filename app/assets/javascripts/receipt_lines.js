document.addEventListener('DOMContentLoaded', function() {
  const addReceiptLineButton = document.getElementById('add-receipt-line');
  const receiptLinesTable = document.getElementById('receipt-lines').getElementsByTagName('tbody')[0];

  addReceiptLineButton.addEventListener('click', function(event) {
    event.preventDefault();

    // Clone the first line to create a new line
    const newRow = document.querySelector('.receipt-line').cloneNode(true);
    const newIndex = document.querySelectorAll('.receipt-line').length;

    // Update the name attributes to reflect the new index
    newRow.querySelectorAll('input').forEach(function(input) {
      const name = input.getAttribute('name').replace(/\d+/, newIndex);
      input.setAttribute('name', name);
      input.value = ''; // Clear out the value
    });

    // Append the new row to the table
    receiptLinesTable.appendChild(newRow);
  });

  // Event delegation to handle removing lines
  document.addEventListener('click', function(event) {
    if (event.target.classList.contains('remove-receipt-line')) {
      event.preventDefault();
      const row = event.target.closest('.receipt-line');
      row.remove();
    }
  });
});

