<?php require_once __DIR__ . '/header.php'; ?>

<h1>Wszystkie Produkty</h1>

<div class="products-container">
    <?php if (!empty($products)): ?>
        <?php foreach ($products as $product): ?>
            <div class="product-card">
                <?php if ($product['main_image']): ?>
                    <img src="<?= htmlspecialchars($product['main_image']) ?>" alt="<?= htmlspecialchars($product['name']) ?>" class="product-image">
                <?php else: ?>
                    <img src="/shop/public/images/default_product.jpg" alt="Brak zdjęcia" class="product-image">
                <?php endif; ?>
                <h3><?= htmlspecialchars($product['name']) ?></h3>
                <p><?= htmlspecialchars(substr($product['description'], 0, 100)) ?>...</p>
                <p><strong>Cena:</strong> <?= htmlspecialchars($product['price']) ?> PLN</p>
                <p><strong>Kategoria:</strong> <?= htmlspecialchars($product['category_name']) ?></p>
                <a href="index.php?controller=Product&action=show&id=<?= htmlspecialchars($product['id']) ?>" class="btn btn-view">Szczegóły</a>
            </div>
        <?php endforeach; ?>
    <?php else: ?>
        <p>Brak dostępnych produktów.</p>
    <?php endif; ?>
</div>

<?php require_once __DIR__ . '/footer.php'; ?>
