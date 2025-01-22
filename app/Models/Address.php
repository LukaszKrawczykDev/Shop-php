<?php
namespace App\Models;
use PDO;
require_once __DIR__ . '/../../init.php';

class Address
{
    public static function getAllByUser($user_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT * FROM user_addresses WHERE user_id = :uid ORDER BY created_at DESC");
        $stmt->execute([':uid' => $user_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getById($address_id, $user_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT * FROM user_addresses WHERE id = :id AND user_id = :uid LIMIT 1");
        $stmt->execute([
            ':id' => $address_id,
            ':uid' => $user_id
        ]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function add($user_id, $full_name, $address, $city, $postal_code, $phone_number = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("INSERT INTO user_addresses (user_id, full_name, address, city, postal_code, phone_number, created_at)
                               VALUES (:uid, :fname, :addr, :city, :pc, :phone, NOW())");
        $result = $stmt->execute([
            ':uid' => $user_id,
            ':fname' => $full_name,
            ':addr' => $address,
            ':city' => $city,
            ':pc' => $postal_code,
            ':phone' => $phone_number
        ]);

        if ($result) {
            return $pdo->lastInsertId();
        }
        return false;
    }

    public static function update($address_id, $user_id, $full_name, $address, $city, $postal_code, $phone_number = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("UPDATE user_addresses
                               SET full_name = :fname, address = :addr,
                                   city = :city, postal_code = :pc, phone_number = :phone
                               WHERE id = :id AND user_id = :uid");
        return $stmt->execute([
            ':fname' => $full_name,
            ':addr' => $address,
            ':city' => $city,
            ':pc' => $postal_code,
            ':phone' => $phone_number,
            ':id' => $address_id,
            ':uid' => $user_id
        ]);
    }

    public static function delete($address_id, $user_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("DELETE FROM user_addresses WHERE id = :id AND user_id = :uid");
        return $stmt->execute([
            ':id' => $address_id,
            ':uid' => $user_id
        ]);
    }
}
