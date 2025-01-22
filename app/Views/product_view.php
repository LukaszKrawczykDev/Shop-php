<?php
require_once __DIR__ . '/header.php';
?>
<main class="product-details-container">
    <div class="product-images">
        <img src="<?= htmlspecialchars($product['main_image']) ?>" alt="<?= htmlspecialchars($product['name']) ?>"
            class="product-main-image">
    </div>
    <div class="product-info">
        <h1 class="product-title"><?= htmlspecialchars($product['name']) ?></h1>
        <p class="product-description"><?= nl2br(htmlspecialchars($product['description'])) ?></p>
        <p class="product-price"><?= number_format($product['price'], 2) ?> zł</p>
        <a href="index.php?controller=Cart&action=add&product_id=<?= $product['id'] ?>" class="btn-add-to-cart">Dodaj do
            koszyka</a>
    </div>
</main>
<?php
require_once __DIR__ . '/footer.php';
