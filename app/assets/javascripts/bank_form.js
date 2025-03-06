document.addEventListener('DOMContentLoaded', () => {
  const postingGroupSelect = document.querySelector('#bank_posting_group'); // Get the dropdown for posting_group
  const glAccountField = document.querySelector('#bank_glaccount'); // Get the field to populate glaccount

  // Add event listener to detect change in posting_group dropdown
  postingGroupSelect.addEventListener('change', () => {
    const selectedGroup = postingGroupSelect.value; // Get the selected posting_group value

    if (selectedGroup) {
      // Perform AJAX request to fetch the corresponding glaccount
      fetch(`/bankgroups/${selectedGroup}/get_glaccount`)
        .then(response => response.json())
        .then(data => {
          glAccountField.value = data.glaccount; // Populate the glaccount field
        })
        .catch(error => {
          console.error('Error fetching glaccount:', error);
        });
    } else {
      // Clear the glaccount field if no posting_group is selected
      glAccountField.value = '';
    }
  });
});

