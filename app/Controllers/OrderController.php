<?php
namespace App\Controllers;
require_once __DIR__ . '/../Models/Order.php';
require_once __DIR__ . '/../Models/Address.php';
use App\Models\Order;
use App\Models\Address;
use PDO;

class OrderController
{
    public function checkout()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }
        $user_id = $_SESSION['user_id'];
        $cart = $_SESSION['cart'] ?? [];
        if (empty($cart)) {
            die("Koszyk jest pusty. Najpierw dodaj produkty.");
        }
        $addresses = Address::getAllByUser($user_id);
        $error = null;
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $address_option = $_POST['address_option'] ?? null;
            if ($address_option === 'select' && isset($_POST['address_id'])) {
                $address_id = intval($_POST['address_id']);
                $selected_address = Address::getById($address_id, $user_id);
                if (!$selected_address) {
                    $error = "Wybrany adres nie istnieje.";
                }
            } elseif ($address_option === 'new') {
                $full_name_new = trim($_POST['full_name_new'] ?? '');
                $address_new = trim($_POST['address_new'] ?? '');
                $city_new = trim($_POST['city_new'] ?? '');
                $postal_code_new = trim($_POST['postal_code_new'] ?? '');
                $phone_number_new = trim($_POST['phone_number_new'] ?? '');
                if ($full_name_new === '' || $address_new === '' || $city_new === '' || $postal_code_new === '') {
                    $error = "Proszę wypełnić wszystkie wymagane pola adresu.";
                } else {
                    $address_id = Address::add($user_id, $full_name_new, $address_new, $city_new, $postal_code_new, $phone_number_new);
                    if (!$address_id) {
                        $error = "Wystąpił błąd podczas dodawania nowego adresu.";
                    }
                }
            } else {
                $error = "Proszę wybrać opcję adresu (istniejący lub nowy).";
            }
            if (!$error) {
                $pdo = connectDB();
                $pdo->beginTransaction();
                try {
                    $total = 0;
                    foreach ($cart as $item) {
                        $total += $item['price'] * $item['quantity'];
                    }
                    if ($address_option === 'select') {
                        $full_name = $selected_address['full_name'];
                        $address = $selected_address['address'];
                        $city = $selected_address['city'];
                        $postal_code = $selected_address['postal_code'];
                        $phone_number = $selected_address['phone_number'];
                    } elseif ($address_option === 'new') {
                        $full_name = $full_name_new;
                        $address = $address_new;
                        $city = $city_new;
                        $postal_code = $postal_code_new;
                        $phone_number = $phone_number_new;
                    }
                    $order_id = Order::add(
                        $user_id,
                        $address_id,
                        $total,
                        $full_name,
                        $address,
                        $city,
                        $postal_code,
                        $phone_number
                    );
                    foreach ($cart as $product_id => $item) {
                        Order::addItem($order_id, $product_id, $item['quantity'], $item['price']);
                        Order::updateStock($product_id, $item['quantity']);
                    }

                    $pdo->commit();
                    unset($_SESSION['cart']);
                    header("Location: index.php?controller=Order&action=thankYou&order_id=$order_id");
                    exit;
                } catch (\Exception $e) {
                    $pdo->rollBack();
                    $error = "Wystąpił błąd podczas składania zamówienia: " . $e->getMessage();
                }
            }
        }
        require __DIR__ . '/../Views/checkout_view.php';
    }

    public function thankYou()
    {
        $order_id = $_GET['order_id'] ?? null;
        if (!$order_id) {
            die("Brak numeru zamówienia.");
        }
        $order = Order::getById($order_id, $_SESSION['user_id']);
        if (!$order) {
            die("Zamówienie nie istnieje lub nie należy do zalogowanego użytkownika.");
        }
        require_once __DIR__ . '/../Views/thankyou_view.php';
    }

    public function myOrders()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }
        $orders = Order::getAllByUser($_SESSION['user_id']);
        require __DIR__ . '/../Views/myorders_view.php';
    }

    public function view()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }
        $order_id = $_GET['order_id'] ?? null;
        if (!$order_id) {
            die("Brak numeru zamówienia.");
        }
        $user_id = $_SESSION['user_id'];
        $order = Order::getById($order_id, $user_id);
        if (!$order) {
            die("Zamówienie nie istnieje lub nie należy do zalogowanego użytkownika.");
        }
        $products = Order::getProductsByOrderId($order_id);
        require __DIR__ . '/../Views/myorder_details_view.php';
    }
}
