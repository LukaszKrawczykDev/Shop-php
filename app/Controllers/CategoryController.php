<?php
namespace App\Controllers;
use App\Models\Product;
use App\Models\Category;

class CategoryController
{
    public function show()
    {
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        $category_id = $_GET['id'] ?? null;
        if (!$category_id) {
            $_SESSION['error'] = "Brak ID kategorii.";
            header('Location: index.php');
            exit;
        }
        $category = Category::getById($category_id);
        if (!$category) {
            $_SESSION['error'] = "Kategoria nie istnieje.";
            header('Location: index.php');
            exit;
        }
        $subcategories = Category::getSubcategories($category_id);
        $subcategory_ids = array_column($subcategories, 'id');
        $all_category_ids = array_merge([$category_id], $subcategory_ids);
        $price_min = isset($_GET['price_min']) ? floatval($_GET['price_min']) : null;
        $price_max = isset($_GET['price_max']) ? floatval($_GET['price_max']) : null;
        $sort = $_GET['sort'] ?? '';
        $products = Product::getByCategories($all_category_ids, $price_min, $price_max, $sort);
        require __DIR__ . '/../Views/category_view.php';
    }
}
?>