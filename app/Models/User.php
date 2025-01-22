<?php
namespace App\Models;
require_once __DIR__ . '/../../init.php';
use PDO;

class User
{
    public static function login($email, $password)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT * FROM users WHERE email = :email LIMIT 1");
        $stmt->execute([':email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            return $user;
        }
        return null;
    }

    public static function register($name, $email, $password, $birth_date = null, $country = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT id FROM users WHERE email = :email LIMIT 1");
        $stmt->execute([':email' => $email]);
        if ($stmt->rowCount() > 0) {
            return false;
        }

        $hashedPass = password_hash($password, PASSWORD_BCRYPT);
        $sql = "INSERT INTO users (name, email, password, role, created_at, birth_date, country)
                VALUES (:name, :email, :pass, 'user', NOW(), :birth_date, :country)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':name' => $name,
            ':email' => $email,
            ':pass' => $hashedPass,
            ':birth_date' => $birth_date,
            ':country' => $country
        ]);
        return true;
    }
    public static function getAll()
    {
        $pdo = connectDB();
        $stmt = $pdo->query("SELECT * FROM users ORDER BY created_at DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function delete($id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("DELETE FROM users WHERE id = :id LIMIT 1");
        return $stmt->execute([':id' => $id]);
    }

    public static function getAllAdmin($search = '')
    {
        $pdo = connectDB();

        $sql = "SELECT * FROM users WHERE 1=1";
        $params = [];

        if (!empty($search)) {
            $sql .= " AND (name LIKE ? OR email LIKE ?)";
            $params[] = '%' . $search . '%';
            $params[] = '%' . $search . '%';
        }

        $sql .= " ORDER BY created_at DESC";

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getByIdAdmin($id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT * FROM users WHERE id = ? LIMIT 1");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function updateAdmin($id, $name, $email, $role)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            UPDATE users
            SET name = ?,
                email = ?,
                role = ?
            WHERE id = ?
            LIMIT 1
        ");
        return $stmt->execute([$name, $email, $role, $id]);
    }

    public static function countAllAdmin()
    {
        $pdo = connectDB();
        $stmt = $pdo->query("SELECT COUNT(*) as total FROM users");
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['total'] ?? 0;
    }

    public static function countNewUsersLastWeek()
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM users WHERE created_at >= DATE_SUB(NOW(), INTERVAL 1 WEEK)");
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['total'] ?? 0;
    }

}
