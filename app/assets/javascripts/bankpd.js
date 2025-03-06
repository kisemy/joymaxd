// app/javascript/packs/product_form.js

// document.addEventListener("DOMContentLoaded", () => {
//  const bankSelect = document.getElementById("bank_name-select");
//  const bank_nameField = document.getElementById("bank_name");
  

//  if (bankSelect) {
//    bankSelect.addEventListener("change", (event) => {
  //    const selectedBankId = event.target.value;

      // Fetch the category data (mocking the data here, but you'd typically do an AJAX call)
//      fetch(`/banks/${selectedBankId}`)
 //       .then(response => response.json())
 //       .then(data => {
 //         bank_nameField.value = data.bank_name
 //         bank_acc_noField.value = data.bank_acc_no;
 //       });
 //   });
 // }
//}); fetch(`/categories/${selectedCategoryId}`)


document.addEventListener("DOMContentLoaded", () => {
  const bankSelect = document.getElementById("bank-select");
  const descriptionField = document.getElementById("payment-paying_acc_code");
  const payingaccountField = document.getElementById("payment-paying_acc_description");

  if (bankSelect) {
    bankSelect.addEventListener("change", (event) => {
      const selectedBankId = event.target.value;

      fetch(`/banks/${selectedBankId}`)
        .then(response => response.json())
        .then(data => {
          if (data) {
            descriptionField.value = data.bank_name;
            payingaccountField.value = data.bank_acc_no;
          }
        })
        .catch(error => console.error('Error fetching category data:', error));
    });
  }
});






