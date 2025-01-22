<?php
namespace App\Models;
use PDO;

class Category
{
    public static function getById($id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT * FROM categories 
            WHERE id = :id 
            LIMIT 1
        ");
        $stmt->execute([':id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public static function getSubcategories($parent_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT * FROM categories 
            WHERE parent_id = :parent_id
            ORDER BY name ASC
        ");
        $stmt->execute([':parent_id' => $parent_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getAll()
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT * FROM categories ORDER BY name ASC");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public static function getMainCategories()
    {
        $pdo = connectDB();
        $stmt = $pdo->query("SELECT * FROM categories WHERE parent_id IS NULL ORDER BY name ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public static function getSubcategoryIds($parent_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("SELECT id FROM categories WHERE parent_id = :pid");
        $stmt->execute([':pid' => $parent_id]);
        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    }

    public static function getHierarchy()
    {
        $main = self::getMainCategories();
        $result = [];
        foreach ($main as $mcat) {
            $subcats = self::getSubcategories($mcat['id']);
            $mcat['subcats'] = $subcats;
            $result[] = $mcat;
        }
        return $result;
    }
}
?>