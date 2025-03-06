document.addEventListener("DOMContentLoaded", () => {
  const categorySelect = document.getElementById("category-select");
  const descriptionField = document.getElementById("product-description");
  const priceField = document.getElementById("product-price");

  if (categorySelect) {
    categorySelect.addEventListener("change", (event) => {
      const selectedCategoryId = event.target.value;

      fetch(`/categories/${selectedCategoryId}`)
        .then(response => response.json())
        .then(data => {
          if (data) {
            descriptionField.value = data.default_description || '';
            priceField.value = data.default_price || '';
          }
        })
        .catch(error => console.error('Error fetching category data:', error));
    });
  }
});

