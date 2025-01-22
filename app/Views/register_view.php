<?php
require_once __DIR__ . '/header.php';
?>
<main style="width: 95%; max-width: 600px; margin: 20px auto;">
  <?php if (!empty($error)): ?>
    <p style="color:red;"><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <div class="auth-container">
    <h2>Rejestracja</h2>
    <form action="index.php?controller=User&action=register" method="POST" class="auth-form">
        <div class="form-group">
            <label for="name">Imię i nazwisko:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Adres email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Hasło:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="birth_date">Data urodzenia (opcjonalne):</label>
            <input type="date" id="birth_date" name="birth_date">
        </div>
        <div class="form-group">
            <label for="country">Kraj:</label>
            <select id="country" name="country">
                <option value="">-- Wybierz kraj --</option>
                <option value="PL">Polska</option>
                <option value="DE">Niemcy</option>
                <option value="GB">Wielka Brytania</option>
                <option value="US">Stany Zjednoczone</option>
                <option value="FR">Francja</option>
            </select>
        </div>
        
        <button type="submit" class="btn-auth">Zarejestruj się</button>
    </form>
  </div>
</main>
<?php
require_once __DIR__ . '/footer.php';
