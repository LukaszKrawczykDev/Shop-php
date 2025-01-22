<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Potwierdzenie Zamówienia</h2>
    <p>Dziękujemy za złożenie zamówienia!</p>
    <p><strong>Numer Zamówienia:</strong> <?= htmlspecialchars($order['id']) ?></p>
    <p><strong>Data:</strong> <?= htmlspecialchars($order['created_at']) ?></p>
    <p><strong>Status:</strong> <?= htmlspecialchars($order['status']) ?></p>
    <p><strong>Całkowita Cena:</strong> <?= number_format($order['total_price'], 2) ?> PLN</p>
    <a href="index.php?controller=Order&action=myOrders" class="btn">Zobacz Moje Zamówienia</a>
</main>
<?php
require_once __DIR__ . '/footer.php';
?>