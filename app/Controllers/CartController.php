<?php
namespace App\Controllers;

use App\Models\Product;

class CartController
{
    public function view()
    {

        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }
        $cart = $_SESSION['cart'] ?? [];
        require __DIR__ . '/../Views/cart_view.php';
    }

    public function add()
    {
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        $product_id = $_GET['product_id'] ?? null;
        if (!$product_id) {
            $_SESSION['error'] = "Brak ID produktu.";
            header('Location: index.php');
            exit;
        }
        $product = Product::getById($product_id);
        if (!$product) {
            $_SESSION['error'] = "Produkt nie istnieje.";
            header('Location: index.php');
            exit;
        }
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }
        if (isset($_SESSION['cart'][$product_id])) {
            $current_qty = $_SESSION['cart'][$product_id]['quantity'];
            if ($current_qty < $product['stock']) {
                $_SESSION['cart'][$product_id]['quantity']++;
            } else {
                $_SESSION['error'] = "Nie możesz dodać więcej niż {$product['stock']} szt. produktu '{$product['name']}'.";
            }
        } else {
            $_SESSION['cart'][$product_id] = [
                'id' => $product['id'],
                'name' => $product['name'],
                'price' => $product['price'],
                'quantity' => 1,
                'main_image' => $product['main_image'],
                'stock' => $product['stock'], // <-- Klucz stock
            ];
        }

        header('Location: index.php?controller=Cart&action=view');
        exit;
    }

    public function remove()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }

        $product_id = $_GET['product_id'] ?? null;
        if (!$product_id) {
            die("Brak ID produktu.");
        }

        if (isset($_SESSION['cart'][$product_id])) {
            unset($_SESSION['cart'][$product_id]);
        }

        header('Location: index.php?controller=Cart&action=view');
        exit;
    }

    public function update()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $product_id = $_GET['product_id'] ?? null;
            if (!$product_id) {
                die("Brak ID produktu w zapytaniu.");
            }

            $quantity = (int) ($_POST['quantity'] ?? 1);
            $product = Product::getById($product_id);
            if (!$product) {
                unset($_SESSION['cart'][$product_id]);
                $_SESSION['error'] = "Wybrany produkt nie istnieje.";
                header('Location: index.php?controller=Cart&action=view');
                exit;
            }

            if (!isset($_SESSION['cart'][$product_id])) {
                header('Location: index.php?controller=Cart&action=view');
                exit;
            }
            if ($quantity > $product['stock']) {
                $_SESSION['cart'][$product_id]['quantity'] = $product['stock'];
                $_SESSION['error'] = "Maksymalna ilość produktu '{$product['name']}' to {$product['stock']} szt.";
            } elseif ($quantity < 1) {
                unset($_SESSION['cart'][$product_id]);
            } else {
                $_SESSION['cart'][$product_id]['quantity'] = $quantity;
            }
            header('Location: index.php?controller=Cart&action=view');
            exit;
        }

        header('Location: index.php?controller=Cart&action=view');
        exit;
    }
}
?>