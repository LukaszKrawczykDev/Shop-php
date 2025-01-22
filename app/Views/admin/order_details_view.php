<h2>Szczegóły zamówienia #<?= $order['id'] ?></h2>

<?php if (isset($_SESSION['success'])): ?>
  <div class="success" style="padding:10px; background-color:#d4edda; color:#155724; margin-bottom:10px;">
    <?= htmlspecialchars($_SESSION['success']) ?>
  </div>
  <?php unset($_SESSION['success']); ?>
<?php endif; ?>

<?php if (isset($_SESSION['error'])): ?>
  <div class="error" style="padding:10px; background-color:#f8d7da; color:#721c24; margin-bottom:10px;">
    <?= htmlspecialchars($_SESSION['error']) ?>
  </div>
  <?php unset($_SESSION['error']); ?>
<?php endif; ?>

<?php
function translateStatus($st) {
    switch($st) {
        case 'pending':   return 'Oczekujące';
        case 'completed': return 'Zrealizowane';
        case 'cancelled': return 'Anulowane';
        default:          return htmlspecialchars($st);
    }
}
?>

<div style="margin-bottom:20px;">
  <p><strong>Użytkownik:</strong> <?= htmlspecialchars($order['user_name']) ?> (<?= htmlspecialchars($order['user_email']) ?>)</p>
  <p><strong>Status:</strong> <?= translateStatus($order['status']) ?></p>
  <p><strong>Kwota:</strong> <?= number_format($order['total_price'],2) ?> PLN</p>
  <p><strong>Data:</strong> <?= htmlspecialchars($order['created_at']) ?></p>

  <?php if (isset($order['address']) && isset($order['city']) && isset($order['postal_code'])): ?>
    <p><strong>Adres dostawy:</strong></p>
    <p>
      <?= htmlspecialchars($order['full_name']) ?><br>
      <?= htmlspecialchars($order['address']) ?><br>
      <?= htmlspecialchars($order['city']) ?>, <?= htmlspecialchars($order['postal_code']) ?><br>
      <?php if (!empty($order['phone_number'])): ?>
        Telefon: <?= htmlspecialchars($order['phone_number']) ?>
      <?php endif; ?>
    </p>
  <?php endif; ?>
</div>

<h3>Pozycje w zamówieniu</h3>
<?php if (empty($items)): ?>
  <p>Brak pozycji.</p>
<?php else: ?>
  <table style="width:100%; border-collapse:collapse;">
    <thead>
      <tr style="background-color:#f2f2f2;">
        <th style="padding:8px; border:1px solid #ddd;">Produkt</th>
        <th style="padding:8px; border:1px solid #ddd;">Ilość</th>
        <th style="padding:8px; border:1px solid #ddd;">Cena</th>
        <th style="padding:8px; border:1px solid #ddd;">Razem</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach ($items as $it): ?>
      <?php 
        $rowTotal = $it['price'] * $it['quantity'];
      ?>
      <tr>
        <td style="padding:8px; border:1px solid #ddd;">
          <?= htmlspecialchars($it['product_name'] ?? 'Nieznany') ?>
        </td>
        <td style="padding:8px; border:1px solid #ddd;">
          <?= (int)$it['quantity'] ?>
        </td>
        <td style="padding:8px; border:1px solid #ddd;">
          <?= number_format($it['price'],2) ?> PLN
        </td>
        <td style="padding:8px; border:1px solid #ddd;">
          <?= number_format($rowTotal, 2) ?> PLN
        </td>
      </tr>
    <?php endforeach; ?>
    </tbody>
  </table>
<?php endif; ?>