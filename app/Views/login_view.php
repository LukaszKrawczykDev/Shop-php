<?php
require_once __DIR__ . '/header.php';
?>
<main style="width: 95%; max-width: 600px; margin: 20px auto;">
  <?php if (!empty($error)): ?>
    <p style="color:red;"><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <?php if (!empty($_SESSION['msg'])): ?>
    <p style="color: green;"><?= htmlspecialchars($_SESSION['msg']) ?></p>
    <?php unset($_SESSION['msg']); ?>
  <?php endif; ?>

  <div class="auth-container">
    <h1>Logowanie</h1>
    <form action="index.php?controller=User&action=login" method="POST" class="auth-form">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Hasło:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn-auth">Zaloguj</button>
    </form>
  </div>
</main>
<?php
require_once __DIR__ . '/footer.php';
