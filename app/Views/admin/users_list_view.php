<main class="main-content">
  <h2>Lista Użytkowników</h2>

  <?php if (isset($_SESSION['success'])): ?>
    <div class="success"><?= htmlspecialchars($_SESSION['success']) ?></div>
    <?php unset($_SESSION['success']); ?>
  <?php endif; ?>
  <?php if (isset($_SESSION['error'])): ?>
    <div class="error"><?= htmlspecialchars($_SESSION['error']) ?></div>
    <?php unset($_SESSION['error']); ?>
  <?php endif; ?>

  <form action="index.php" method="GET" style="margin-bottom: 20px; display:flex; gap:10px;">
    <input type="hidden" name="controller" value="Admin">
    <input type="hidden" name="action" value="usersList">

    <input type="text" name="search" placeholder="Szukaj po imieniu/emailu"
      value="<?= htmlspecialchars($_GET['search'] ?? '') ?>" style="padding:6px; width:200px;">

    <button type="submit" class="btn">Szukaj</button>
  </form>

  <?php if (empty($users)): ?>
    <p>Brak użytkowników.</p>
  <?php else: ?>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Nazwa</th>
          <th>Email</th>
          <th>Rola</th>
          <th>Data utworzenia</th>
          <th>Akcje</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($users as $u): ?>
          <tr>
            <td data-label="ID"><?= $u['id'] ?></td>
            <td data-label="Nazwa"><?= htmlspecialchars($u['name']) ?></td>
            <td data-label="Email"><?= htmlspecialchars($u['email']) ?></td>
            <td data-label="Rola"><?= htmlspecialchars($u['role']) ?></td>
            <td data-label="Data"><?= htmlspecialchars($u['created_at']) ?></td>
            <td data-label="Akcje">
              <a href="index.php?controller=Admin&action=userEdit&id=<?= $u['id'] ?>" class="btn">Edytuj</a>
              <a href="index.php?controller=Admin&action=userDelete&id=<?= $u['id'] ?>" class="btn-delete"
                onclick="return confirm('Usunąć użytkownika?');">
                Usuń
              </a>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  <?php endif; ?>
</main>