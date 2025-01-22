<?php
namespace App\Controllers;

require_once __DIR__ . '/../../init.php';

use PDO;
class HomeController
{
    public function index()
    {
        $pdo = connectDB();
        $sql = "SELECT * FROM products ORDER BY created_at DESC LIMIT 4";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $latestProducts = $stmt->fetchAll(PDO::FETCH_ASSOC);
        require __DIR__ . '/../Views/home_view.php';
    }
}
