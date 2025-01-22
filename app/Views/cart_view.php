<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Twój Koszyk</h2>

    <?php if (empty($cart)): ?>
        <p>Twój koszyk jest pusty.</p>
    <?php else: ?>
        <table>
            <thead>
                <tr>
                    <th>Produkt</th>
                    <th>Cena</th>
                    <th>Ilość</th>
                    <th>Razem</th>
                    <th>Akcje</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $total_price = 0;
                foreach ($cart as $product_id => $item):
                    $total = $item['price'] * $item['quantity'];
                    $total_price += $total;
                    ?>
                    <tr>
                        <td data-label="Produkt"><?= htmlspecialchars($item['name']) ?></td>
                        <td data-label="Cena"><?= number_format($item['price'], 2) ?> PLN</td>
                        <td data-label="Ilość">
                            <form action="index.php?controller=Cart&action=update&product_id=<?= $product_id ?>" method="POST"
                                class="cart-form">
                                <input class="cart-quantity-input" type="number" name="quantity"
                                    value="<?= htmlspecialchars($item['quantity']) ?>" min="1"
                                    max="<?= isset($item['stock']) ? (int) $item['stock'] : (int) $item['quantity'] ?>" required>
                                <button type="submit" class="btn btn-edit">Aktualizuj</button>
                            </form>
                        </td>
                        <td data-label="Razem"><?= number_format($total, 2) ?> PLN</td>
                        <td data-label="Akcje">
                            <a href="index.php?controller=Cart&action=remove&product_id=<?= $product_id ?>"
                                class="btn btn-delete" onclick="return confirm('Czy na pewno chcesz usunąć ten produkt?');">
                                Usuń
                            </a>
                        </td>
                    </tr>
                <?php endforeach; ?>
                <tr>
                    <td colspan="3" style="text-align: right; font-weight: bold;">Całkowita Kwota:</td>
                    <td colspan="2" style="font-weight: bold;"><?= number_format($total_price, 2) ?> PLN</td>
                </tr>
            </tbody>
        </table>
        <a href="index.php?controller=Order&action=checkout" class="btn">Przejdź do Finalizacji Zamówienia</a>
    <?php endif; ?>
</main>
<?php
require_once __DIR__ . '/footer.php';
?>