<!-- /app/Views/admin/dashboard_view.php -->
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <title>Dashboard Admina</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
    <main class="admin-content">
        <div class="summary-section">
            <h2 style="margin-bottom: 20px;">Jako administrator masz pełną kontrolę nad sklepem. Oto Twoje możliwości:
            </h2>
            <ul>
                <li>Zarządzanie użytkownikami: przeglądanie listy użytkowników, edycja i usuwanie kont.</li>
                <li>Zarządzanie produktami: dodawanie nowych produktów, edycja istniejących oraz ich usuwanie.</li>
                <li>Zarządzanie zamówieniami: przeglądanie wszystkich zamówień, wyszukiwanie, filtrowanie, zmiana
                    statusu oraz anulowanie zamówień z automatycznym przywracaniem stanów magazynowych.</li>
            </ul>
        </div>

        <h3>Podsumowanie Statystyk</h3>
        <div class="stats-container">
            <div class="stat-card">
                <h4>Liczba użytkowników</h4>
                <p><?= htmlspecialchars($totalUsers) ?></p>
            </div>

            <div class="stat-card warning">
                <h4>Zamówienia oczekujące</h4>
                <p><?= htmlspecialchars($pendingOrders) ?></p>
            </div>

            <div class="stat-card success">
                <h4>Zamówienia zrealizowane</h4>
                <p><?= htmlspecialchars($completedOrders) ?></p>
            </div>

            <div class="stat-card danger">
                <h4>Zamówienia anulowane</h4>
                <p><?= htmlspecialchars($cancelledOrders) ?></p>
            </div>
        </div>

        <div class="summary-section">
            <h3>Ogólne Statystyki</h3>
            <p>W ostatnim tygodniu:</p>
            <ul>
                <li>Nowi użytkownicy: <strong><?= htmlspecialchars($newUsersLastWeek) ?></strong></li>
                <li>Średnia liczba zamówień na dzień: <strong><?= htmlspecialchars($averageOrdersPerDay) ?></strong>
                </li>
                <li>Najczęściej sprzedawane produkty:</li>
                <ol>
                    <?php foreach ($topSellingProducts as $product): ?>
                        <li><?= htmlspecialchars($product['name']) ?> - <?= htmlspecialchars($product['total_sold']) ?>
                            sztuk</li>
                    <?php endforeach; ?>
                </ol>
            </ul>
        </div>
        <div class="chart-container">
            <h3>Wykres Zamówień w Ostatnim Tygodniu</h3>
            <canvas id="ordersChart" width="400" height="200"></canvas>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const ctx = document.getElementById('ordersChart').getContext('2d');
                const ordersChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Pon', 'Wt', 'Śr', 'Czw', 'Pt', 'Sob', 'Nd'],
                        datasets: [{
                            label: 'Liczba zamówień',
                            data: <?= json_encode($ordersChartData) ?>,
                            backgroundColor: 'rgba(52, 152, 219, 0.6)',
                            borderColor: 'rgba(52, 152, 219, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                precision: 0
                            }
                        }
                    }
                });
            });
        </script>
</body>

</html>