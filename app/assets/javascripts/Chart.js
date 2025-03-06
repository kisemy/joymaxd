
  document.addEventListener('DOMContentLoaded', () => {
    const ctx = document.getElementById('incomeExpensesChart').getContext('2d');
    try {
      new Chart(ctx, {
        type: 'pie',
        data: {
          labels: ['Income', 'Expenses'],
          datasets: [{
            data: [<%= @income_expenses[:income] %>, <%= @income_expenses[:expenses] %>],
            backgroundColor: ['#4caf50', '#f44336']
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false
        }
      });
    } catch (error) {
      console.error("Chart.js Error: ", error);
    }
  });

