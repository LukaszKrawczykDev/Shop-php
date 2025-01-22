<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Dodaj Nowy Adres</h2>

    <?php if (!empty($error)): ?>
        <div class="error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>

    <form action="index.php?controller=Address&action=add" method="POST" class="address-form">
        <div class="form-group">
            <label for="full_name">Imię i Nazwisko:</label>
            <input type="text" id="full_name" name="full_name" required>
        </div>
        <div class="form-group">
            <label for="address">Adres:</label>
            <input type="text" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="city">Miasto:</label>
            <input type="text" id="city" name="city" required>
        </div>
        <div class="form-group">
            <label for="postal_code">Kod Pocztowy:</label>
            <input type="text" id="postal_code" name="postal_code" placeholder="12-345" pattern="\d{2}-\d{3}"
                title="Kod pocztowy powinien mieć format XX-XXX" required>
        </div>
        <div class="form-group">
            <label for="phone_number">Telefon:</label>
            <input type="text" id="phone_number" name="phone_number">
        </div>
        <button type="submit" class="btn btn-submit">Dodaj Adres</button>
    </form>
</main>
<?php
require_once __DIR__ . '/footer.php';
?>