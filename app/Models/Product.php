<?php
namespace App\Models;

use PDO;

class Product
{
    public static function getAll($price_min = null, $price_max = null, $sort = '')
    {
        $pdo = connectDB();
        $sql = "
            SELECT p.*, c.name AS category_name 
            FROM products p 
            JOIN categories c ON p.category_id = c.id 
            WHERE 1=1
        ";
        $params = [];
        if ($price_min !== null) {
            $sql .= " AND p.price >= :price_min";
            $params[':price_min'] = $price_min;
        }

        if ($price_max !== null) {
            $sql .= " AND p.price <= :price_max";
            $params[':price_max'] = $price_max;
        }
        $allowed_sort = ['price_asc', 'price_desc', 'name_asc', 'name_desc'];
        if (in_array($sort, $allowed_sort)) {
            switch ($sort) {
                case 'price_asc':
                    $sql .= " ORDER BY p.price ASC";
                    break;
                case 'price_desc':
                    $sql .= " ORDER BY p.price DESC";
                    break;
                case 'name_asc':
                    $sql .= " ORDER BY p.name ASC";
                    break;
                case 'name_desc':
                    $sql .= " ORDER BY p.name DESC";
                    break;
            }
        } else {
            $sql .= " ORDER BY p.created_at DESC";
        }

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getById($id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT p.*, c.name AS category_name 
            FROM products p 
            JOIN categories c ON p.category_id = c.id 
            WHERE p.id = :id 
            LIMIT 1
        ");
        $stmt->execute([':id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function add($name, $price, $description = null, $main_image = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            INSERT INTO products (name, price, description, main_image) 
            VALUES (:name, :price, :description, :main_image)
        ");
        return $stmt->execute([
            ':name' => $name,
            ':price' => $price,
            ':description' => $description,
            ':main_image' => $main_image
        ]);
    }

    public static function update($product_id, $name, $price, $description = null, $main_image = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            UPDATE products 
            SET name = :name, price = :price, description = :description, main_image = :main_image 
            WHERE id = :id
        ");
        return $stmt->execute([
            ':name' => $name,
            ':price' => $price,
            ':description' => $description,
            ':main_image' => $main_image,
            ':id' => $product_id
        ]);
    }

    public static function delete($product_id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("DELETE FROM products WHERE id = :id");
        return $stmt->execute([':id' => $product_id]);
    }

    public static function search($query, $price_min = null, $price_max = null, $sort = '')
    {
        $pdo = connectDB();
        $sql = "
        SELECT p.*, c.name AS category_name 
        FROM products p 
        JOIN categories c ON p.category_id = c.id 
        WHERE (p.name LIKE :query OR p.description LIKE :query)
    ";
        $params = [':query' => '%' . $query . '%'];
        if ($price_min !== null && $price_min > 0) {
            $sql .= " AND p.price >= :price_min";
            $params[':price_min'] = $price_min;
        }

        if ($price_max !== null && $price_max > 0) {
            $sql .= " AND p.price <= :price_max";
            $params[':price_max'] = $price_max;
        }
        $allowed_sort = ['price_asc', 'price_desc', 'name_asc', 'name_desc'];
        if (in_array($sort, $allowed_sort)) {
            switch ($sort) {
                case 'price_asc':
                    $sql .= " ORDER BY p.price ASC";
                    break;
                case 'price_desc':
                    $sql .= " ORDER BY p.price DESC";
                    break;
                case 'name_asc':
                    $sql .= " ORDER BY p.name ASC";
                    break;
                case 'name_desc':
                    $sql .= " ORDER BY p.name DESC";
                    break;
            }
        } else {
            $sql .= " ORDER BY p.created_at DESC";
        }

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function countSearchResults($query, $price_min = null, $price_max = null)
    {
        $pdo = connectDB();
        $sql = "
            SELECT COUNT(*) as count 
            FROM products p 
            JOIN categories c ON p.category_id = c.id 
            WHERE (p.name LIKE :query OR p.description LIKE :query)
        ";
        $params = [':query' => '%' . $query . '%'];
        if ($price_min !== null) {
            $sql .= " AND p.price >= :price_min";
            $params[':price_min'] = $price_min;
        }
        if ($price_max !== null) {
            $sql .= " AND p.price <= :price_max";
            $params[':price_max'] = $price_max;
        }
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['count'];
    }
    public static function getByCategories($category_ids, $price_min = null, $price_max = null, $sort = '')
    {
        $pdo = connectDB();
        if (empty($category_ids)) {
            return [];
        }
        $placeholders = implode(',', array_fill(0, count($category_ids), '?'));
        $sql = "
            SELECT p.*, c.name AS category_name 
            FROM products p 
            JOIN categories c ON p.category_id = c.id 
            WHERE p.category_id IN ($placeholders)
        ";
        $params = $category_ids;

        if ($price_min !== null && $price_min > 0) {
            $sql .= " AND p.price >= ?";
            $params[] = $price_min;
        }

        if ($price_max !== null && $price_max > 0) {
            $sql .= " AND p.price <= ?";
            $params[] = $price_max;
        }

        $allowed_sort = ['price_asc', 'price_desc', 'name_asc', 'name_desc'];
        if (in_array($sort, $allowed_sort)) {
            switch ($sort) {
                case 'price_asc':
                    $sql .= " ORDER BY p.price ASC";
                    break;
                case 'price_desc':
                    $sql .= " ORDER BY p.price DESC";
                    break;
                case 'name_asc':
                    $sql .= " ORDER BY p.name ASC";
                    break;
                case 'name_desc':
                    $sql .= " ORDER BY p.name DESC";
                    break;
            }
        } else {
            $sql .= " ORDER BY p.created_at DESC";
        }

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getAllWithCategories($searchName = '', $categoryId = 0)
    {
        $pdo = connectDB();
        $sql = "
            SELECT p.*,
                   c1.name AS subcat_name,
                   c1.id   AS subcat_id,
                   c2.name AS maincat_name,
                   c2.id   AS maincat_id
            FROM products p
            JOIN categories c1 ON p.category_id = c1.id
            LEFT JOIN categories c2 ON c1.parent_id = c2.id
            WHERE 1=1
        ";
        $params = [];

        if (!empty($searchName)) {
            $sql .= " AND p.name LIKE :searchName";
            $params[':searchName'] = '%' . $searchName . '%';
        }

        if ($categoryId > 0) {
            $sql .= " AND c1.id = :catId";
            $params[':catId'] = $categoryId;
        }
        $sql .= " ORDER BY p.created_at DESC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function addAdmin($name, $price, $description, $category_id, $stock, $main_image = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            INSERT INTO products 
            (name, price, description, category_id, stock, main_image, created_at)
            VALUES (?, ?, ?, ?, ?, ?, NOW())
        ");
        return $stmt->execute([
            $name,
            $price,
            $description,
            $category_id,
            $stock,
            $main_image
        ]);
    }

    public static function updateAdmin($id, $name, $price, $description, $category_id, $stock, $main_image = null)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            UPDATE products
            SET name = ?,
                price = ?,
                description = ?,
                category_id = ?,
                stock = ?,
                main_image = ?
            WHERE id = ?
        ");
        return $stmt->execute([
            $name,
            $price,
            $description,
            $category_id,
            $stock,
            $main_image,
            $id
        ]);
    }

    public static function getByIdAdmin($id)
    {
        $pdo = connectDB();
        $stmt = $pdo->prepare("
            SELECT p.*,
                   c1.parent_id AS maincat_id,  /* jeżeli c1.parent_id = null, to produkt w głównej */
                   p.category_id AS subcat_id
            FROM products p
            LEFT JOIN categories c1 ON p.category_id = c1.id
            WHERE p.id = ?
            LIMIT 1
        ");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function getAllWithCategoriesAdmin($searchName = '', $selectedCatId = 0)
    {
        $pdo = connectDB();
        $sql = "
            SELECT p.*,
                   c1.name AS subcat_name, c1.id AS subcat_id,
                   c2.name AS maincat_name, c2.id AS maincat_id
            FROM products p
            JOIN categories c1 ON p.category_id = c1.id
            LEFT JOIN categories c2 ON c1.parent_id = c2.id
            WHERE 1=1 
        ";
        $params = [];
        if (!empty($searchName)) {
            $sql .= " AND p.name LIKE ? ";
            $params[] = '%' . $searchName . '%';
        }

        if ($selectedCatId > 0) {
            $subcatIds = Category::getSubcategoryIds($selectedCatId);
            $allCatIds = array_merge([$selectedCatId], $subcatIds);
            $placeholders = rtrim(str_repeat('?,', count($allCatIds)), ',');
            $sql .= " AND c1.id IN ($placeholders) ";
            foreach ($allCatIds as $cid) {
                $params[] = $cid;
            }
        }

        $sql .= " ORDER BY p.created_at DESC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>