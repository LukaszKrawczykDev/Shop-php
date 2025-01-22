<?php
require_once __DIR__ . '/header.php';
?>
<main class="main-content">
    <h2>Moje Adresy</h2>

    <p><a href="index.php?controller=Address&action=add" class="btn btn-add">Dodaj Nowy Adres</a></p>

    <?php if (empty($addresses)): ?>
        <p>Nie masz jeszcze zapisanych adresów.</p>
    <?php else: ?>
        <table class="addresses-table">
            <thead>
                <tr>
                    <th>Imię i Nazwisko</th>
                    <th>Adres</th>
                    <th>Miasto</th>
                    <th>Kod Pocztowy</th>
                    <th>Telefon</th>
                    <th>Akcje</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($addresses as $addr): ?>
                    <tr>
                        <td><?= htmlspecialchars($addr['full_name']) ?></td>
                        <td><?= htmlspecialchars($addr['address']) ?></td>
                        <td><?= htmlspecialchars($addr['city']) ?></td>
                        <td><?= htmlspecialchars($addr['postal_code']) ?></td>
                        <td><?= htmlspecialchars($addr['phone_number']) ?></td>
                        <td>
                            <a href="index.php?controller=Address&action=edit&id=<?= htmlspecialchars($addr['id']) ?>"
                                class="btn btn-edit">Edytuj</a>
                            <a href="index.php?controller=Address&action=delete&id=<?= htmlspecialchars($addr['id']) ?>"
                                class="btn btn-delete"
                                onclick="return confirm('Czy na pewno chcesz usunąć ten adres?');">Usuń</a>
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