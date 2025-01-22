<?php
namespace App\Controllers;
use App\Models\Product;

class ProductController
{
    public function show($product_id = null)
    {
        if (!$product_id) {
            die("Brak ID produktu.");
        }
        $product = Product::getById($product_id);
        if (!$product) {
            die("Produkt nie istnieje.");
        }
        require __DIR__ . '/../Views/product_view.php';
    }

    public function list()
    {
        $products = Product::getAll();
        require __DIR__ . '/../Views/products_view.php';
    }

    public function search()
    {
        $query = trim($_GET['query'] ?? '');
        $price_min = isset($_GET['price_min']) ? floatval($_GET['price_min']) : null;
        $price_max = isset($_GET['price_max']) ? floatval($_GET['price_max']) : null;
        $sort = $_GET['sort'] ?? '';
        if ($query === '') {
            header('Location: index.php?controller=Product&action=list');
            exit;
        }
        $products = Product::search($query, $price_min, $price_max, $sort);
        require __DIR__ . '/../Views/search_results_view.php';
    }
}
?>