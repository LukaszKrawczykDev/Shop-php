<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Szczegóły Zamówienia</h2>

    <h3>Zamówienie #<?= htmlspecialchars($order['id']) ?></h3>
    <p>Data zamówienia: <?= htmlspecialchars($order['created_at']) ?></p>
    <p>Status: <?= translateStatusToPolish(htmlspecialchars($order['status'])) ?></p>

    <h3>Adres dostawy:</h3>
    <p><?= htmlspecialchars($order['full_name']) ?></p>
    <p><?= htmlspecialchars($order['address']) ?></p>
    <p><?= htmlspecialchars($order['city']) ?>, <?= htmlspecialchars($order['postal_code']) ?></p>
    <p>Telefon: <?= htmlspecialchars($order['phone_number']) ?></p>

    <h3>Produkty w zamówieniu:</h3>
    <table class="order-details-table">
        <thead>
            <tr>
                <th>Produkt</th>
                <th>Cena</th>
                <th>Ilość</th>
                <th>Łącznie</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($products as $product): ?>
                <tr>
                    <td><?= htmlspecialchars($product['name']) ?></td>
                    <td><?= htmlspecialchars($product['price']) ?> PLN</td>
                    <td><?= htmlspecialchars($product['quantity']) ?></td>
                    <td><?= htmlspecialchars($product['price'] * $product['quantity']) ?> PLN</td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <p><strong>Całkowita cena: <?= htmlspecialchars($order['total_price']) ?> PLN</strong></p>
</main>
<?php
require_once __DIR__ . '/footer.php';

function translateStatusToPolish($status)
{
    $statuses = [
        'pending' => 'Oczekujące',
        'completed' => 'Zakończone',
        'cancelled' => 'Anulowane'
    ];

    return $statuses[$status] ?? ucfirst($status);
}
?>