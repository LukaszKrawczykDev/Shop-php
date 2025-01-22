<?php
require_once __DIR__ . '/header.php';
?>
<main>
    <section class="shop-description">
        <h1>Witamy w naszym sklepie!</h1>
        <p>
            Jesteśmy Twoim zaufanym dostawcą sprzętu elektronicznego. Oferujemy szeroki wybór produktów, w tym laptopy, smartfony, RTV i AGD, konsole oraz akcesoria najwyzszej jakości.
        </p>
        <p>
            Naszą misją jest zapewnienie najlepszego doświadczenia zakupowego dzięki konkurencyjnym cenom, błyskawicznej dostawie oraz profesjonalnej obsłudze klientów.
        </p>
    </section>
    <section class="shop-features">
        <div class="feature">
            <h3>Błyskawiczna dostawa</h3>
            <p>Oferujemy szybką i bezpieczną dostawę na terenie całego kraju.</p>
        </div>
        <div class="feature">
            <h3>Gwarancja na produkty</h3>
            <p>Wszystkie nasze produkty objęte są gwarancją, aby zapewnić Ci spokój.</p>
        </div>
        <div class="feature">
            <h3>Wsparcie techniczne</h3>
            <p>Nasz zespół jest zawsze gotowy do pomocy. Masz pytania? Zadzwoń pod numer 
                123 456 789</p>
        </div>
    </section>
    <section class="latest-products">
        <h2>Ostatnio dodane produkty</h2>
        <div class="products-grid">
            <?php foreach ($latestProducts as $product): ?>
                <a href="index.php?controller=Product&action=show&id=<?= $product['id'] ?>" class="product-card">
                    <img 
                        src="<?= htmlspecialchars($product['main_image']) ?>" 
                        alt="<?= htmlspecialchars($product['name']) ?>"
                    >
                    <h3><?= htmlspecialchars($product['name']) ?></h3>
                    <p class="price"><?= number_format($product['price'], 2) ?> zł</p>
                </a>
            <?php endforeach; ?>
        </div>
    </section>
</main>
<?php
require_once __DIR__ . '/footer.php';
