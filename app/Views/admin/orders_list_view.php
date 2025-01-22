<h2>Lista Zamówień</h2>

<?php if (isset($_SESSION['success'])): ?>
  <div class="success"><?= htmlspecialchars($_SESSION['success']) ?></div>
  <?php unset($_SESSION['success']); ?>
<?php endif; ?>

<?php if (isset($_SESSION['error'])): ?>
  <div class="error"><?= htmlspecialchars($_SESSION['error']) ?></div>
  <?php unset($_SESSION['error']); ?>
<?php endif; ?>

<div class="orders-filters" style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center;">
  <form action="index.php" method="GET" style="display: flex; gap: 5px;">
    <input type="hidden" name="controller" value="Admin">
    <input type="hidden" name="action" value="ordersList">

    <input type="text" name="search" 
           placeholder="Wyszukaj (ID, nazwa, email)" 
           value="<?= htmlspecialchars($_GET['search'] ?? '') ?>"
           style="padding:6px; width:200px;">
    <button type="submit" class="btn" style="padding:6px 12px;">Szukaj</button>
  </form>

  <form action="index.php" method="GET" style="display: flex; gap: 5px;">
    <input type="hidden" name="controller" value="Admin">
    <input type="hidden" name="action" value="ordersList">
    <select name="status" style="padding:6px;">
      <option value="">--Wszystkie--</option>
      <option value="pending"   <?= (@$_GET['status']=='pending')?'selected':''?>>Oczekujące</option>
      <option value="completed" <?= (@$_GET['status']=='completed')?'selected':''?>>Zrealizowane</option>
      <option value="cancelled" <?= (@$_GET['status']=='cancelled')?'selected':''?>>Anulowane</option>
    </select>
    <button type="submit" class="btn" style="padding:6px 12px;">Filtruj</button>
  </form>
</div>

<?php
function translateStatus($status) {
  switch ($status) {
    case 'pending':   return 'Oczekujące';
    case 'completed': return 'Zrealizowane';
    case 'cancelled': return 'Anulowane';
  }
  return $status; 
}
?>

<?php if (empty($orders)): ?>
  <p>Brak zamówień spełniających kryteria.</p>
<?php else: ?>
  <table style="width: 100%; border-collapse: collapse;">
    <thead>
      <tr style="background-color: #f2f2f2;">
        <th style="padding: 8px; border-bottom: 1px solid #ddd;">ID</th>
        <th style="padding: 8px; border-bottom: 1px solid #ddd;">Użytkownik</th>
        <th style="padding: 8px; border-bottom: 1px solid #ddd;">Email</th>
        <th style="padding: 8px; border-bottom: 1px solid #ddd;">Status</th>
        <th style="padding: 8px; border-bottom: 1px solid #ddd;">Kwota</th>
        <th style="padding: 8px; border-bottom: 1px solid #ddd;">Data</th>
        <th style="padding: 8px; border-bottom: 1px solid #ddd;">Akcje</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach ($orders as $o): ?>
      <tr>
        <td style="padding: 8px; border-bottom: 1px solid #ddd;"><?= $o['id'] ?></td>
        <td style="padding: 8px; border-bottom: 1px solid #ddd;"><?= htmlspecialchars($o['user_name'] ?? '') ?></td>
        <td style="padding: 8px; border-bottom: 1px solid #ddd;"><?= htmlspecialchars($o['user_email'] ?? '') ?></td>
        <td style="padding: 8px; border-bottom: 1px solid #ddd;">
          <?= translateStatus($o['status']) ?>
        </td>
        <td style="padding: 8px; border-bottom: 1px solid #ddd;">
          <?= number_format($o['total_price'],2) ?> PLN
        </td>
        <td style="padding: 8px; border-bottom: 1px solid #ddd;">
          <?= htmlspecialchars($o['created_at']) ?>
        </td>
        <td style="padding: 8px; border-bottom: 1px solid #ddd;">
          <a href="index.php?controller=Admin&action=orderDetails&id=<?= $o['id'] ?>" 
             class="btn"
             style="margin-right: 4px;">
            Szczegóły
          </a>
          <form action="index.php?controller=Admin&action=orderUpdateStatus" 
                method="POST" 
                style="display:inline-block; margin-right: 4px;">
            <input type="hidden" name="order_id" value="<?= $o['id'] ?>">
            <select name="status" style="padding:4px;">
              <option value="pending"   <?=($o['status']=='pending')?'selected':''?>>Oczekujące</option>
              <option value="completed" <?=($o['status']=='completed')?'selected':''?>>Zrealizowane</option>
              <option value="cancelled" <?=($o['status']=='cancelled')?'selected':''?>>Anulowane</option>
            </select>
            <button type="submit" class="btn" style="padding:4px 8px;">Zmień</button>
          </form>

          <?php if ($o['status'] !== 'cancelled'): ?>
            <a href="index.php?controller=Admin&action=orderCancel&id=<?= $o['id'] ?>" 
               class="btn-delete"
               style="padding:4px 8px;"
               onclick="return confirm('Anulować zamówienie #<?= $o['id'] ?>?');">
              Anuluj
            </a>
          <?php endif; ?>
        </td>
      </tr>
    <?php endforeach; ?>
    </tbody>
  </table>
<?php endif; ?>