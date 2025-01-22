<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Moje Zamówienia</h2>

    <?php if (empty($orders)): ?>
        <p>Nie masz jeszcze złożonych zamówień.</p>
    <?php else: ?>
        <table>
            <thead>
                <tr>
                    <th>ID Zamówienia</th>
                    <th>Data</th>
                    <th>Status</th>
                    <th>Całkowita Cena</th>
                    <th>Akcje</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($orders as $order): ?>
                    <tr>
                        <td data-label="ID Zamówienia"><?= htmlspecialchars($order['id']) ?></td>
                        <td data-label="Data"><?= htmlspecialchars($order['created_at']) ?></td>
                        <td data-label="Status">
                            <?php
                            $statusTranslation = [
                                'pending' => 'Oczekujące',
                                'completed' => 'Zakończone',
                                'cancelled' => 'Anulowane'
                            ];

                            $statusKey = $order['status'];
                            $statusPolish = isset($statusTranslation[$statusKey])
                                ? $statusTranslation[$statusKey]
                                : $statusKey;

                            echo htmlspecialchars($statusPolish);
                            ?>
                        </td>
                        <td data-label="Całkowita Cena"><?= number_format($order['total_price'], 2) ?> PLN</td>
                        <td data-label="Akcje">
                            <a href="index.php?controller=Order&action=view&order_id=<?= $order['id'] ?>"
                                class="btn">Szczegóły</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
</main>
<?php
require_once __DIR__ . '/footer.php';
?>