<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Złóż Zamówienie</h2>

    <?php if (!empty($error)): ?>
        <div class="error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>

    <form action="index.php?controller=Order&action=checkout" method="POST" class="checkout-form">
        <h3>Wybierz adres z listy lub dodaj nowy</h3>

        <div class="address-options">
            <input type="radio" id="select_address" name="address_option" value="select" checked>
            <label for="select_address" class="address-option-button">Wybierz istniejący adres</label>

            <input type="radio" id="new_address" name="address_option" value="new">
            <label for="new_address" class="address-option-button">Wpisz nowy adres</label>
        </div>

        <div id="existing_addresses" class="address-section">
            <?php if (!empty($addresses)): ?>
                <table class="addresses-table">
                    <thead>
                        <tr>
                            <th>Wybierz</th>
                            <th>Imię i Nazwisko</th>
                            <th>Adres</th>
                            <th>Miasto</th>
                            <th>Kod Pocztowy</th>
                            <th>Telefon</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($addresses as $addr): ?>
                            <tr>
                                <td>
                                    <input type="radio" name="address_id" value="<?= htmlspecialchars($addr['id']) ?>"
                                        id="address_<?= htmlspecialchars($addr['id']) ?>">
                                </td>
                                <td><label
                                        for="address_<?= htmlspecialchars($addr['id']) ?>"><?= htmlspecialchars($addr['full_name']) ?></label>
                                </td>
                                <td><?= htmlspecialchars($addr['address']) ?></td>
                                <td><?= htmlspecialchars($addr['city']) ?></td>
                                <td><?= htmlspecialchars($addr['postal_code']) ?></td>
                                <td><?= htmlspecialchars($addr['phone_number']) ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p>Brak zapisanych adresów. Wybierz opcję wpisania nowego.</p>
            <?php endif; ?>
        </div>

        <div id="new_address_fields" class="address-section">
            <div class="form-group">
                <label for="full_name_new">Imię i Nazwisko:</label>
                <input type="text" id="full_name_new" name="full_name_new">
            </div>
            <div class="form-group">
                <label for="address_new">Adres:</label>
                <input type="text" id="address_new" name="address_new">
            </div>
            <div class="form-group">
                <label for="city_new">Miasto:</label>
                <input type="text" id="city_new" name="city_new">
            </div>
            <div class="form-group">
                <label for="postal_code_new">Kod Pocztowy:</label>
                <input type="text" id="postal_code_new" name="postal_code_new" placeholder="12-345"
                    pattern="\d{2}-\d{3}" title="Kod pocztowy powinien mieć format XX-XXX">
            </div>
            <div class="form-group">
                <label for="phone_number_new">Telefon:</label>
                <input type="text" id="phone_number_new" name="phone_number_new">
            </div>
        </div>

        <button type="submit" class="btn btn-place-order">Złóż Zamówienie</button>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const selectAddressRadio = document.getElementById('select_address');
            const newAddressRadio = document.getElementById('new_address');
            const existingAddresses = document.getElementById('existing_addresses');
            const newAddressFields = document.getElementById('new_address_fields');
            const submitButton = document.querySelector('.btn-place-order');

            function updateSections() {
                if (newAddressRadio.checked) {
                    existingAddresses.style.display = 'none';
                    newAddressFields.style.display = 'block';
                    submitButton.disabled = false;
                } else {
                    existingAddresses.style.display = 'block';
                    newAddressFields.style.display = 'none';
                    const selected = document.querySelector('input[name="address_id"]:checked');
                    submitButton.disabled = !selected;
                }
            }

            selectAddressRadio.addEventListener('change', updateSections);
            newAddressRadio.addEventListener('change', updateSections);

            const addressRadios = document.querySelectorAll('input[name="address_id"]');
            addressRadios.forEach(radio => {
                radio.addEventListener('change', () => {
                    if (selectAddressRadio.checked) {
                        submitButton.disabled = false;
                    }
                });
            });

            updateSections();
        });
    </script>
</main>
<?php
require_once __DIR__ . '/footer.php';
?>