<?php
$isEdit = isset($user); 
?>
<h2><?= $isEdit ? "Edycja Użytkownika #{$user['id']}" : "Dodaj nowego użytkownika" ?></h2>

<?php if (isset($_SESSION['error'])): ?>
  <div class="error"><?= htmlspecialchars($_SESSION['error']) ?></div>
  <?php unset($_SESSION['error']); ?>
<?php endif; ?>
<?php if (isset($_SESSION['success'])): ?>
  <div class="success"><?= htmlspecialchars($_SESSION['success']) ?></div>
  <?php unset($_SESSION['success']); ?>
<?php endif; ?>

<form action="" method="POST">
  <div class="form-group">
    <label for="name">Imię i nazwisko (lub nazwa):</label>
    <input type="text" name="name" id="name" 
           value="<?= $isEdit ? htmlspecialchars($user['name']) : '' ?>" 
           required>
  </div>

  <div class="form-group">
    <label for="email">Adres email:</label>
    <input type="email" name="email" id="email"
           value="<?= $isEdit ? htmlspecialchars($user['email']) : '' ?>"
           required>
  </div>

  <div class="form-group">
    <label for="role">Rola:</label>
    <select name="role" id="role">
      <option value="user"  <?= ($isEdit && $user['role'] === 'user')  ? 'selected' : '' ?>>Użytkownik</option>
      <option value="admin" <?= ($isEdit && $user['role'] === 'admin') ? 'selected' : '' ?>>Administrator</option>
    </select>
  </div>

  <button type="submit" class="btn"><?= $isEdit ? "Zapisz" : "Dodaj" ?></button>
</form>