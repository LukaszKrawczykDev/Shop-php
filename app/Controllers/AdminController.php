<?php
namespace App\Controllers;

use App\Models\Product;
use App\Models\User;
use App\Models\Order;
use App\Models\Category;
use PDO;

class AdminController
{
    private function ensureIsAdmin()
    {
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'admin') {
            header('Location: index.php');
            exit;
        }
    }

    public function dashboard()
    {
        $this->ensureIsAdmin();
        $totalUsers = User::countAllAdmin();
        $pendingOrders = Order::countOrdersByStatusAdmin('pending');
        $completedOrders = Order::countOrdersByStatusAdmin('completed');
        $cancelledOrders = Order::countOrdersByStatusAdmin('cancelled');
        $newUsersLastWeek = User::countNewUsersLastWeek();
        $averageOrdersPerDay = Order::averageOrdersPerDayLastWeek();
        $topSellingProducts = Order::getTopSellingProducts(5);
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT DATE(created_at) as order_date, COUNT(*) as daily_orders
            FROM orders
            WHERE created_at >= DATE_SUB(NOW(), INTERVAL 1 WEEK)
            GROUP BY DATE(created_at)
            ORDER BY DATE(created_at) ASC
        ");
        $stmt->execute();
        $ordersData = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $daysOfWeek = ['Pon', 'Wt', 'Śr', 'Czw', 'Pt', 'Sob', 'Nd'];
        $ordersChartData = array_fill(0, 7, 0);

        foreach ($ordersData as $order) {
            $dayNumber = date('N', strtotime($order['order_date'])) - 1;
            if (isset($ordersChartData[$dayNumber])) {
                $ordersChartData[$dayNumber] = (int) $order['daily_orders'];
            }
        }
        $adminView = __DIR__ . '/../Views/admin/dashboard_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }


    public function productsList()
    {
        $this->ensureIsAdmin();
        $searchName = $_GET['searchName'] ?? '';
        $catId = (int) ($_GET['cat'] ?? 0);
        $products = Product::getAllWithCategoriesAdmin($searchName, $catId);
        $mainCategories = Category::getMainCategories();
        $adminView = __DIR__ . '/../Views/admin/products_list_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }

    public function productAdd()
    {
        $this->ensureIsAdmin();
        $mainCategories = Category::getMainCategories();
        $allCats = Category::getAll();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = $_POST['name'] ?? '';
            $price = floatval($_POST['price'] ?? 0);
            $description = $_POST['description'] ?? '';
            $maincat_id = (int) ($_POST['maincat_id'] ?? 0);
            $subcat_id = (int) ($_POST['subcat_id'] ?? 0);
            $stock = (int) ($_POST['stock'] ?? 0);
            $main_image = null;
            if (!empty($_FILES['main_image']['name'])) {
                $filename = $_FILES['main_image']['name'];
                $tmpPath = $_FILES['main_image']['tmp_name'];
                $ext = pathinfo($filename, PATHINFO_EXTENSION);
                $newName = uniqid('prod_') . '.' . $ext;
                move_uploaded_file($tmpPath, __DIR__ . '/../../../public/images/' . $newName);
                $main_image = $newName;
            }
            $category_id = ($subcat_id > 0) ? $subcat_id : $maincat_id;
            $ok = Product::addAdmin($name, $price, $description, $category_id, $stock, $main_image);
            if ($ok) {
                $_SESSION['success'] = "Dodano produkt: $name";
            } else {
                $_SESSION['error'] = "Błąd przy dodawaniu produktu.";
            }
            header('Location: index.php?controller=Admin&action=productsList');
            exit;
        }
        $adminView = __DIR__ . '/../Views/admin/product_form_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }
    public function productEdit()
    {
        $this->ensureIsAdmin();
        $id = $_GET['id'] ?? null;
        $product = Product::getByIdAdmin($id);
        if (!$product) {
            $_SESSION['error'] = "Produkt nie istnieje.";
            header('Location: index.php?controller=Admin&action=productsList');
            exit;
        }
        $mainCategories = Category::getMainCategories();
        $allCats = Category::getAll();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = $_POST['name'] ?? '';
            $price = floatval($_POST['price'] ?? 0);
            $description = $_POST['description'] ?? '';
            $maincat_id = (int) ($_POST['maincat_id'] ?? 0);
            $subcat_id = (int) ($_POST['subcat_id'] ?? 0);
            $stock = (int) ($_POST['stock'] ?? 0);
            $main_image = $product['main_image'];
            if (!empty($_FILES['main_image']['name'])) {
                $filename = $_FILES['main_image']['name'];
                $tmpPath = $_FILES['main_image']['tmp_name'];
                $ext = pathinfo($filename, PATHINFO_EXTENSION);
                $newName = uniqid('prod_') . '.' . $ext;
                move_uploaded_file($tmpPath, __DIR__ . '/../../../public/images/' . $newName);
                $main_image = $newName;
            }
            $category_id = ($subcat_id > 0) ? $subcat_id : $maincat_id;
            $ok = Product::updateAdmin($id, $name, $price, $description, $category_id, $stock, $main_image);
            if ($ok) {
                $_SESSION['success'] = "Zaktualizowano produkt: $name";
            } else {
                $_SESSION['error'] = "Błąd edycji produktu.";
            }
            header('Location: index.php?controller=Admin&action=productsList');
            exit;
        }
        $adminView = __DIR__ . '/../Views/admin/product_form_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }

    public function productDelete()
    {
        $this->ensureIsAdmin();
        $id = $_GET['id'] ?? null;
        if ($id) {
            $ok = Product::delete($id);
            if ($ok) {
                $_SESSION['success'] = "Usunięto produkt #$id";
            } else {
                $_SESSION['error'] = "Błąd usuwania produktu #$id";
            }
        }
        header('Location: index.php?controller=Admin&action=productsList');
        exit;
    }
    public function usersList()
    {
        $this->ensureIsAdmin();
        $search = $_GET['search'] ?? '';
        $users = User::getAllAdmin($search);
        $adminView = __DIR__ . '/../Views/admin/users_list_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }

    public function userDelete()
    {
        $this->ensureIsAdmin();
        $id = $_GET['id'] ?? null;
        if ($id) {
            if ($id == $_SESSION['user_id']) {
                $_SESSION['error'] = "Nie możesz usunąć swojego własnego konta!";
            } else {
                $ok = User::delete($id);
                if ($ok) {
                    $_SESSION['success'] = "Usunięto użytkownika #$id";
                } else {
                    $_SESSION['error'] = "Błąd przy usuwaniu użytkownika #$id";
                }
            }
        }
        header('Location: index.php?controller=Admin&action=usersList');
        exit;
    }

    public function ordersList()
    {
        $this->ensureIsAdmin();
        $search = $_GET['search'] ?? '';
        $status = $_GET['status'] ?? '';
        $orders = Order::getAllAdmin($search, $status);
        $adminView = __DIR__ . '/../Views/admin/orders_list_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }

    public function orderDetails()
    {
        $this->ensureIsAdmin();
        $order_id = $_GET['id'] ?? null;
        if (!$order_id) {
            $_SESSION['error'] = "Nieprawidłowe ID zamówienia.";
            header('Location: index.php?controller=Admin&action=ordersList');
            exit;
        }
        $order = Order::getByIdAdmin($order_id);
        if (!$order) {
            $_SESSION['error'] = "Zamówienie nie istnieje.";
            header('Location: index.php?controller=Admin&action=ordersList');
            exit;
        }
        $items = Order::getProductsByOrderId($order_id);
        $adminView = __DIR__ . '/../Views/admin/order_details_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }

    public function orderUpdateStatus()
    {
        $this->ensureIsAdmin();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $order_id = $_POST['order_id'] ?? null;
            $newStatus = $_POST['status'] ?? null;
            if ($order_id && $newStatus) {
                if ($newStatus === 'cancelled') {
                    $ok = Order::updateStatusAdmin($order_id, 'cancelled', true);
                } else {
                    $ok = Order::updateStatusAdmin($order_id, $newStatus, false);
                }
                if ($ok) {
                    $_SESSION['success'] = "Zmieniono status zamówienia #$order_id na '$newStatus'.";
                } else {
                    $_SESSION['error'] = "Błąd aktualizacji statusu.";
                }
            }
        }
        header('Location: index.php?controller=Admin&action=ordersList');
        exit;
    }

    public function userEdit()
    {
        $this->ensureIsAdmin();
        $id = $_GET['id'] ?? null;
        $user = User::getByIdAdmin($id);
        if (!$user) {
            $_SESSION['error'] = "Użytkownik nie istnieje.";
            header('Location: index.php?controller=Admin&action=usersList');
            exit;
        }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = $_POST['name'] ?? '';
            $email = $_POST['email'] ?? '';
            $role = $_POST['role'] ?? 'user';

            $ok = User::updateAdmin($id, $name, $email, $role);
            if ($ok) {
                $_SESSION['success'] = "Zaktualizowano użytkownika $name";
            } else {
                $_SESSION['error'] = "Błąd przy edycji użytkownika.";
            }
            header('Location: index.php?controller=Admin&action=usersList');
            exit;
        }
        $adminView = __DIR__ . '/../Views/admin/user_form_view.php';
        require __DIR__ . '/../Views/admin/admin_layout.php';
    }

    public function orderCancel()
    {
        $this->ensureIsAdmin();
        $order_id = $_GET['id'] ?? null;
        if ($order_id) {
            $ok = Order::cancelOrderAdmin($order_id);
            if ($ok) {
                $_SESSION['success'] = "Anulowano zamówienie #$order_id (przywrócono stock).";
            } else {
                $_SESSION['error'] = "Błąd podczas anulowania zamówienia #$order_id.";
            }
        }
        header('Location: index.php?controller=Admin&action=ordersList');
        exit;
    }
}