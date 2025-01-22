<h2 style="margin-bottom: 15px;">Lista Produktów</h2>

<?php if (isset($_SESSION['success'])): ?>
  <div class="success"><?= htmlspecialchars($_SESSION['success']) ?></div>
  <?php unset($_SESSION['success']); ?>
<?php endif; ?>

<?php if (isset($_SESSION['error'])): ?>
  <div class="error"><?= htmlspecialchars($_SESSION['error']) ?></div>
  <?php unset($_SESSION['error']); ?>
<?php endif; ?>

<div class="search-and-add" style="display: flex; gap: 10px; justify-content: center; margin-bottom: 20px;">
  <form action="index.php" method="GET" class="admin-search-form">
    <input type="hidden" name="controller" value="Admin">
    <input type="hidden" name="action" value="productsList">

    <input type="text" name="searchName" class="admin-search-input" placeholder="Wyszukaj produkt..."
      value="<?= htmlspecialchars($_GET['searchName'] ?? '') ?>">
    <button type="submit" class="btn-search">
      <i class="fa fa-search"></i>
    </button>
  </form>
</div>

<p style="display: flex; gap: 10px; justify-content: center; margin-bottom: 20px;">
  <a href="index.php?controller=Admin&action=productsList" class="btn">Wszystkie kategorie</a>
</p>

<div class="admin-categories-bar" style="display: flex; gap: 10px; margin-bottom: 20px;">
  <?php foreach ($mainCategories as $mc): ?>
    <?php
    $subs = App\Models\Category::getSubcategories($mc['id']);
    ?>
    <div class="cat-group" style="position: relative;">
      <a href="index.php?controller=Admin&action=productsList&cat=<?= $mc['id'] ?>" class="btn maincat-btn">
        <?= htmlspecialchars($mc['name']) ?>
      </a>
      <?php if (!empty($subs)): ?>
        <ul class="subcat-dropdown">
          <?php foreach ($subs as $sc): ?>
            <li>
              <a href="index.php?controller=Admin&action=productsList&cat=<?= $sc['id'] ?>">
                <?= htmlspecialchars($sc['name']) ?>
              </a>
            </li>
          <?php endforeach; ?>
        </ul>
      <?php endif; ?>
    </div>
  <?php endforeach; ?>
</div>

<p style="margin-bottom: 20px;">
  <a href="index.php?controller=Admin&action=productAdd" class="btn">Dodaj Produkt</a>
</p>

<?php if (empty($products)): ?>
  <p>Brak produktów.</p>
<?php else: ?>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Nazwa</th>
        <th>Cena</th>
        <th>Stan</th>
        <th>Kategoria</th>
        <th>Akcje</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $p): ?>
        <tr>
          <td><?= $p['id'] ?></td>
          <td><?= htmlspecialchars($p['name']) ?></td>
          <td><?= number_format($p['price'], 2) ?> zł</td>
          <td><?= (int) $p['stock'] ?></td>
          <td>
            <?php
            $maincat = $p['maincat_name'] ?? '';
            $subcat = $p['subcat_name'] ?? '';
            echo htmlspecialchars($maincat);
            if ($maincat && $subcat) {
              echo " / ";
            }
            echo htmlspecialchars($subcat);
            ?>
          </td>
          <td>
            <a href="index.php?controller=Admin&action=productEdit&id=<?= $p['id'] ?>" class="btn">Edytuj</a>
            <a href="index.php?controller=Admin&action=productDelete&id=<?= $p['id'] ?>" class="btn-delete"
              onclick="return confirm('Usunąć produkt?');">
              Usuń
            </a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
<?php endif; ?>