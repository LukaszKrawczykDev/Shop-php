<?php
require_once __DIR__ . '/../init.php';

$controller = $_GET['controller'] ?? 'Home';
$action     = $_GET['action'] ?? 'index';

$controllerClass = 'App\\Controllers\\' . $controller . 'Controller';

if (!class_exists($controllerClass)) {
    die("Kontroler $controller nie istnieje.");
}

$controllerInstance = new $controllerClass();

if (!method_exists($controllerInstance, $action)) {
    die("Metoda $action nie istnieje w kontrolerze $controller.");
}

if (isset($_GET['id'])) {
    $controllerInstance->$action($_GET['id']);
} else {
    $controllerInstance->$action();
}
