<?php require_once __DIR__ . '/header.php'; ?>

<main class="category-container">
    <h1>Wyniki Wyszukiwania dla: "<?= htmlspecialchars($_GET['query']) ?>"</h1>

    <div class="filter-sort-container">
        <form method="GET" action="index.php" class="filter-sort-form">
            <input type="hidden" name="controller" value="Product">
            <input type="hidden" name="action" value="search">
            <input type="hidden" name="query" value="<?= htmlspecialchars($_GET['query']) ?>">

            <div class="filters">
                <label for="price_min">Cena Min:</label>
                <input type="number" name="price_min" id="price_min"
                    value="<?= isset($_GET['price_min']) ? htmlspecialchars($_GET['price_min']) : '' ?>" min="0"
                    step="0.01">

                <label for="price_max">Cena Max:</label>
                <input type="number" name="price_max" id="price_max"
                    value="<?= isset($_GET['price_max']) ? htmlspecialchars($_GET['price_max']) : '' ?>" min="0"
                    step="0.01">
            </div>

            <div class="sort-options">
                <label for="sort">Sortuj według:</label>
                <select name="sort" id="sort">
                    <option value="">-- Wybierz --</option>
                    <option value="price_asc" <?= (isset($_GET['sort']) && $_GET['sort'] == 'price_asc') ? 'selected' : '' ?>>Cena rosnąco</option>
                    <option value="price_desc" <?= (isset($_GET['sort']) && $_GET['sort'] == 'price_desc') ? 'selected' : '' ?>>Cena malejąco</option>
                    <option value="name_asc" <?= (isset($_GET['sort']) && $_GET['sort'] == 'name_asc') ? 'selected' : '' ?>>Nazwa A-Z</option>
                    <option value="name_desc" <?= (isset($_GET['sort']) && $_GET['sort'] == 'name_desc') ? 'selected' : '' ?>>Nazwa Z-A</option>
                </select>
            </div>

            <button type="submit" class="btn-filter-sort">Zastosuj</button>
        </form>
    </div>

    <div class="category-products">
        <?php if (!empty($products)): ?>
            <?php foreach ($products as $prod): ?>
                <div class="product-item">
                    <div class="product-item-image">
                        <a href="index.php?controller=Product&action=show&id=<?= htmlspecialchars($prod['id']) ?>">
                            <?php if ($prod['main_image']): ?>
                                <img src="<?= htmlspecialchars($prod['main_image']) ?>"
                                    alt="<?= htmlspecialchars($prod['name']) ?>">
                            <?php else: ?>
                                <img src="/shop/public/images/default_product.jpg" alt="Brak zdjęcia">
                            <?php endif; ?>
                        </a>
                    </div>
                    <div class="product-item-info">
                        <h3 class="product-name">
                            <a style="text-decoration: none; color: #1F618D;"
                                href="index.php?controller=Product&action=show&id=<?= htmlspecialchars($prod['id']) ?>">
                                <?= htmlspecialchars($prod['name']) ?>
                            </a>
                        </h3>
                        <p class="product-description"><?= nl2br(htmlspecialchars($prod['description'])) ?></p>
                        <p class="product-stock">
                            Stan: <?= (int) $prod['stock'] > 0 ? (int) $prod['stock'] . ' szt. dostępne' : 'Brak w magazynie' ?>
                        </p>
                    </div>
                    <div class="product-item-buy">
                        <p class="product-price"><?= number_format($prod['price'], 2) ?> zł</p>
                        <?php if ((int) $prod['stock'] > 0): ?>
                            <a href="index.php?controller=Cart&action=add&product_id=<?= htmlspecialchars($prod['id']) ?>"
                                class="btn-add-to-cart">
                                Dodaj do koszyka
                            </a>
                        <?php else: ?>
                            <button class="btn-add-to-cart disabled" disabled>Chwilowo niedostępne</button>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>Brak produktów spełniających kryteria wyszukiwania.</p>
        <?php endif; ?>
    </div>
</main>

<?php require_once __DIR__ . '/footer.php'; ?>