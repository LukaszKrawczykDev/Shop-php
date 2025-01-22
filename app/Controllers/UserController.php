<?php
namespace App\Controllers;
require_once __DIR__ . '/../../init.php';
require_once __DIR__ . '/../Models/User.php';
use App\Models\User;
use PDO;

class UserController
{
    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $email = $_POST['email'] ?? '';
            $password = $_POST['password'] ?? '';
            $user = User::login($email, $password);
            if ($user) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_role'] = $user['role'];
                $_SESSION['user_name'] = $user['name'];

                if ($user['role'] === 'admin') {
                    header('Location: index.php?controller=Admin&action=dashboard');
                } else {
                    header('Location: index.php');
                }
                exit;
            } else {
                $error = "Nieprawidłowy email lub hasło.";
            }
        }
        require __DIR__ . '/../Views/login_view.php';
    }

    public function logout()
    {
        session_unset();
        session_destroy();
        header('Location: index.php?controller=Home&action=index');
        exit;
    }

    public function register()
    {
        $error = null;
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = trim($_POST['name'] ?? '');
            $email = trim($_POST['email'] ?? '');
            $password = trim($_POST['password'] ?? '');
            $birth_date = $_POST['birth_date'] ?? null;
            $country = trim($_POST['country'] ?? '');
            $pattern = '/^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$/';
            if (!preg_match($pattern, $password)) {
                $error = "Hasło musi mieć min. 8 znaków, w tym 1 wielką literę, 1 cyfrę i 1 znak specjalny.";
            } else {
                $success = User::register($name, $email, $password, $birth_date, $country);
                if ($success) {
                    $_SESSION['msg'] = "Konto założone! Możesz się zalogować.";
                    header('Location: index.php?controller=User&action=login');
                    exit;
                } else {
                    $error = "Podany email jest już zajęty.";
                }
            }
        }

        require __DIR__ . '/../Views/register_view.php';
    }
}
