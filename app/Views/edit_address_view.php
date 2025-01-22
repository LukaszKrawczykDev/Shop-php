<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Edytuj Adres</h2>

    <?php if (!empty($error)): ?>
        <div class="error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>

    <form action="index.php?controller=Address&action=edit&id=<?= htmlspecialchars($address['id']) ?>" method="POST" class="address-form">
        <div class="form-group">
            <label for="full_name_new">Imię i Nazwisko:</label>
            <input type="text" id="full_name_new" name="full_name_new" value="<?= htmlspecialchars($address['full_name']) ?>" required>
        </div>
        <div class="form-group">
            <label for="address_new">Adres:</label>
            <input type="text" id="address_new" name="address_new" value="<?= htmlspecialchars($address['address']) ?>" required>
        </div>
        <div class="form-group">
            <label for="city_new">Miasto:</label>
            <input type="text" id="city_new" name="city_new" value="<?= htmlspecialchars($address['city']) ?>" required>
        </div>
        <div class="form-group">
            <label for="postal_code_new">Kod Pocztowy:</label>
            <input type="text" id="postal_code_new" name="postal_code_new" value="<?= htmlspecialchars($address['postal_code']) ?>" pattern="\d{2}-\d{3}" title="Kod pocztowy powinien mieć format XX-XXX" required>
        </div>
        <div class="form-group">
            <label for="phone_number_new">Telefon:</label>
            <input type="text" id="phone_number_new" name="phone_number_new" value="<?= htmlspecialchars($address['phone_number']) ?>">
        </div>
        <button type="submit" class="btn btn-submit">Zaktualizuj Adres</button>
    </form>
</main>
<?php
require_once __DIR__ . '/footer.php';
?>
