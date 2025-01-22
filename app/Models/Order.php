<?php
namespace App\Models;
require_once __DIR__ . '/../../init.php';
use PDO;

class Order
{
    public static function getById($order_id, $user_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT * 
            FROM orders 
            WHERE id = :id AND user_id = :uid 
            LIMIT 1
        ");
        $stmt->execute([
            ':id' => $order_id,
            ':uid' => $user_id
        ]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function getAllByUser($user_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT * 
            FROM orders 
            WHERE user_id = :uid 
            ORDER BY created_at DESC
        ");
        $stmt->execute([':uid' => $user_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function add($user_id, $address_id, $total_price, $full_name, $address, $city, $postal_code, $phone_number = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            INSERT INTO orders 
                (user_id, address_id, total_price, full_name, address, city, postal_code, phone_number, status, created_at)
            VALUES 
                (:uid, :addr_id, :total, :fname, :addr, :city, :pc, :phone, 'pending', NOW())
        ");
        $stmt->execute([
            ':uid' => $user_id,
            ':addr_id' => $address_id,
            ':total' => $total_price,
            ':fname' => $full_name,
            ':addr' => $address,
            ':city' => $city,
            ':pc' => $postal_code,
            ':phone' => $phone_number
        ]);
        return $pdo->lastInsertId();
    }

    public static function addItem($order_id, $product_id, $quantity, $price)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            INSERT INTO order_items 
                (order_id, product_id, quantity, price)
            VALUES 
                (:oid, :pid, :qty, :price)
        ");
        return $stmt->execute([
            ':oid' => $order_id,
            ':pid' => $product_id,
            ':qty' => $quantity,
            ':price' => $price
        ]);
    }

    public static function updateStock($product_id, $quantity)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            UPDATE products 
            SET stock = stock - :qty 
            WHERE id = :pid
        ");
        return $stmt->execute([
            ':qty' => $quantity,
            ':pid' => $product_id
        ]);
    }

    public static function getProductsByOrderId($order_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
        SELECT p.name AS product_name, op.price, op.quantity 
        FROM order_items op 
        JOIN products p ON op.product_id = p.id 
        WHERE op.order_id = :order_id
    ");
        $stmt->execute([':order_id' => $order_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getAll()
    {
        $pdo = connectDB();
        $stmt = $pdo->query("SELECT * FROM orders ORDER BY created_at DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public static function getItems($order_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT * FROM order_items WHERE order_id = :oid");
        $stmt->execute([':oid' => $order_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function updateStatus($order_id, $new_status)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("UPDATE orders SET status = :status WHERE id = :id");
        return $stmt->execute([
            ':status' => $new_status,
            ':id' => $order_id
        ]);
    }

    public static function getByIdAdmin($order_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT o.*,
                   u.name AS user_name,
                   u.email AS user_email
            FROM orders o
            JOIN users u ON o.user_id = u.id
            WHERE o.id = ?
            LIMIT 1
        ");
        $stmt->execute([$order_id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public static function getAllAdmin($search = '', $status = '')
    {
        $pdo = connectDB();
        $sql = "
            SELECT o.*, 
                   u.name AS user_name,
                   u.email AS user_email
            FROM orders o
            JOIN users u ON o.user_id = u.id
            WHERE 1=1
        ";
        $params = [];
        if (!empty($search)) {
            $sql .= " AND (o.id LIKE ? OR u.name LIKE ? OR u.email LIKE ?) ";
            $params[] = '%' . $search . '%';
            $params[] = '%' . $search . '%';
            $params[] = '%' . $search . '%';
        }
        if (!empty($status)) {
            $sql .= " AND o.status = ? ";
            $params[] = $status;
        }

        $sql .= " ORDER BY o.created_at DESC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function updateStatusAdmin($order_id, $new_status, $revertIfCancelled = false)
    {
        $pdo = connectDB();
        if ($new_status === 'cancelled' && $revertIfCancelled) {
            self::revertStockAdmin($order_id);
        }
        $stmt = $pdo->prepare("UPDATE orders SET status = ? WHERE id = ? LIMIT 1");
        return $stmt->execute([$new_status, $order_id]);
    }

    public static function cancelOrderAdmin($order_id)
    {
        $pdo = connectDB();
        $pdo->beginTransaction();
        try {
            self::revertStockAdmin($order_id);
            $stmt = $pdo->prepare("UPDATE orders SET status='cancelled' WHERE id=? LIMIT 1");
            $stmt->execute([$order_id]);
            $pdo->commit();
            return true;
        } catch (\Exception $e) {
            $pdo->rollBack();
            return false;
        }
    }

    private static function revertStockAdmin($order_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT product_id, quantity FROM order_items WHERE order_id = ?");
        $stmt->execute([$order_id]);
        $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($items as $it) {
            $stmt2 = $pdo->prepare("UPDATE products SET stock = stock + ? WHERE id = ?");
            $stmt2->execute([$it['quantity'], $it['product_id']]);
        }
    }

    public static function countOrdersByStatusAdmin($status)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM orders WHERE status = ?");
        $stmt->execute([$status]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['total'] ?? 0;
    }

    public static function averageOrdersPerDayLastWeek()
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
        SELECT AVG(daily_orders) as average
        FROM (
            SELECT DATE(created_at) as order_date, COUNT(*) as daily_orders
            FROM orders
            WHERE created_at >= DATE_SUB(NOW(), INTERVAL 1 WEEK)
            GROUP BY DATE(created_at)
        ) as subquery
    ");
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return round($result['average'] ?? 0, 2);
    }

    public static function getTopSellingProducts($limit = 5)
    {
        $pdo = connectDB();
        $limit = (int) $limit;

        $stmt = $pdo->prepare("
        SELECT p.name, SUM(oi.quantity) as total_sold
        FROM order_items oi
        JOIN products p ON oi.product_id = p.id
        GROUP BY oi.product_id
        ORDER BY total_sold DESC
        LIMIT $limit
    ");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}
