<?php
$isEdit = isset($product);
$mainCategories = $mainCategories ?? [];
$allCats = $allCats ?? [];
?>

<h2><?= $isEdit ? "Edycja Produktu #{$product['id']}" : "Dodawanie Produktu" ?></h2>

<?php if (isset($_SESSION['error'])): ?>
    <div class="error"><?= htmlspecialchars($_SESSION['error']) ?></div>
    <?php unset($_SESSION['error']); ?>
<?php endif; ?>
<?php if (isset($_SESSION['success'])): ?>
    <div class="success"><?= htmlspecialchars($_SESSION['success']) ?></div>
    <?php unset($_SESSION['success']); ?>
<?php endif; ?>

<form action="" method="POST" enctype="multipart/form-data">
    <div class="form-group">
        <label for="name">Nazwa produktu:</label>
        <input type="text" name="name" id="name" value="<?= $isEdit ? htmlspecialchars($product['name']) : '' ?>"
            required>
    </div>

    <div class="form-group">
        <label for="price">Cena (PLN):</label>
        <input type="number" step="0.01" name="price" id="price"
            value="<?= $isEdit ? htmlspecialchars($product['price']) : '' ?>">
    </div>

    <div class="form-group">
        <label for="stock">Stan (stock):</label>
        <input type="number" name="stock" id="stock" value="<?= $isEdit ? (int) $product['stock'] : 0 ?>">
    </div>

    <div class="form-group">
        <label for="maincat_id">Kategoria główna:</label>
        <select name="maincat_id" id="maincat_id">
            <option value="0">-- Wybierz --</option>
            <?php foreach ($mainCategories as $mc): ?>
                <option value="<?= $mc['id'] ?>">
                    <?= htmlspecialchars($mc['name']) ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>

    <div class="form-group">
        <label for="subcat_id">Podkategoria:</label>
        <select name="subcat_id" id="subcat_id">
            <option value="0">-- Wybierz --</option>
        </select>
    </div>

    <div class="form-group">
        <label for="description">Opis:</label>
        <textarea name="description" id="description"
            rows="5"><?= $isEdit ? htmlspecialchars($product['description']) : '' ?></textarea>
    </div>

    <?php if ($isEdit && !empty($product['main_image'])): ?>
        <div class="form-group">
            <label>Obecne zdjęcie:</label><br>
            <img src="../public/images/<?= htmlspecialchars($product['main_image']) ?>" style="max-width:200px;">
        </div>
    <?php endif; ?>

    <div class="form-group">
        <label for="main_image">Zdjęcie:</label>
        <input type="file" name="main_image" id="main_image" accept="image/*">
    </div>

    <button type="submit" class="btn"><?= $isEdit ? "Zapisz" : "Dodaj" ?></button>
</form>

<script>
    <?php
    $jsAllCats = json_encode($allCats);
    echo "const allCats = $jsAllCats;";
    ?>

    document.addEventListener('DOMContentLoaded', function () {
        const maincatSelect = document.getElementById('maincat_id');
        const subcatSelect = document.getElementById('subcat_id');

        function populateSubcats(parentId) {
            subcatSelect.innerHTML = '<option value="0">-- Wybierz --</option>';
            if (parentId > 0) {
                const filtered = allCats.filter(cat => cat.parent_id == parentId);
                filtered.forEach(sc => {
                    const opt = document.createElement('option');
                    opt.value = sc.id;
                    opt.textContent = sc.name;
                    subcatSelect.appendChild(opt);
                });
            }
        }

        maincatSelect.addEventListener('change', function () {
            const val = parseInt(this.value);
            populateSubcats(val);
        });

        <?php if ($isEdit): ?>
            const currentCat = <?= (int) ($product['category_id'] ?? 0) ?>;
            const catObj = allCats.find(c => c.id == currentCat);
            if (catObj) {
                if (catObj.parent_id) {
                    const maincat = catObj.parent_id;
                    maincatSelect.value = maincat;
                    populateSubcats(maincat);
                    subcatSelect.value = currentCat;
                } else {
                    maincatSelect.value = currentCat;
                    populateSubcats(currentCat);
                }
            <?php endif; ?>
        });
</script>