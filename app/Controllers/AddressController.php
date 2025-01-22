<?php
namespace App\Controllers;
require_once __DIR__ . '/../Models/Address.php';  
use App\Models\Address;

class AddressController
{
    public function list()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }

        $user_id = $_SESSION['user_id'];
        $addresses = Address::getAllByUser($user_id);
        require __DIR__ . '/../Views/addresses_view.php';
    }
    public function add()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }

        $error = null;

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $full_name    = trim($_POST['full_name'] ?? '');
            $address      = trim($_POST['address'] ?? '');
            $city         = trim($_POST['city'] ?? '');
            $postal_code  = trim($_POST['postal_code'] ?? '');
            $phone_number = trim($_POST['phone_number'] ?? '');

            if ($full_name === '' || $address === '' || $city === '' || $postal_code === '') {
                $error = "Proszę wypełnić wszystkie wymagane pola.";
            } else {
                $user_id = $_SESSION['user_id'];
                $address_id = Address::add($user_id, $full_name, $address, $city, $postal_code, $phone_number);
                if ($address_id) {
                    header('Location: index.php?controller=Address&action=list');
                    exit;
                } else {
                    $error = "Wystąpił błąd podczas dodawania nowego adresu.";
                }
            }
        }
        require __DIR__ . '/../Views/add_address_view.php';
    }

    public function edit()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }
        $error = null;
        $address_id = $_GET['id'] ?? null;
        $user_id = $_SESSION['user_id'];
        if (!$address_id) {
            die("Brak ID adresu.");
        }
        $address = Address::getById($address_id, $user_id);
        if (!$address) {
            die("Adres nie istnieje lub nie należy do użytkownika.");
        }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $full_name_new    = trim($_POST['full_name_new'] ?? '');
            $address_new      = trim($_POST['address_new'] ?? '');
            $city_new         = trim($_POST['city_new'] ?? '');
            $postal_code_new  = trim($_POST['postal_code_new'] ?? '');
            $phone_number_new = trim($_POST['phone_number_new'] ?? '');
            if ($full_name_new === '' || $address_new === '' || $city_new === '' || $postal_code_new === '') {
                $error = "Proszę wypełnić wszystkie wymagane pola.";
            } else {
                $updated = Address::update($address_id, $user_id, $full_name_new, $address_new, $city_new, $postal_code_new, $phone_number_new);
                if ($updated) {
                    header('Location: index.php?controller=Address&action=list');
                    exit;
                } else {
                    $error = "Wystąpił błąd podczas aktualizacji adresu.";
                }
            }
        }
        require __DIR__ . '/../Views/edit_address_view.php';
    }
    public function delete()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?controller=User&action=login');
            exit;
        }
        $address_id = $_GET['id'] ?? null;
        $user_id = $_SESSION['user_id'];
        if (!$address_id) {
            die("Brak ID adresu.");
        }
        $address = Address::getById($address_id, $user_id);
        if (!$address) {
            die("Adres nie istnieje lub nie należy do użytkownika.");
        }
        $deleted = Address::delete($address_id, $user_id);
        if ($deleted) {
            header('Location: index.php?controller=Address&action=list');
            exit;
        } else {
            die("Wystąpił błąd podczas usuwania adresu.");
        }
    }
}
