-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sty 22, 2025 at 10:42 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `created_at`) VALUES
(1, 'Laptopy', NULL, '2025-01-10 04:34:09'),
(2, 'Smartfony', NULL, '2025-01-10 04:34:09'),
(3, 'Komputery', NULL, '2025-01-10 04:34:09'),
(4, 'RTV', NULL, '2025-01-10 04:34:09'),
(5, 'AGD', NULL, '2025-01-10 04:34:09'),
(6, 'Konsole', NULL, '2025-01-10 04:34:09'),
(7, 'Akcesoria', NULL, '2025-01-10 04:34:09'),
(8, 'Ultrabooki', 1, '2025-01-10 04:34:09'),
(9, 'Gamingowe', 1, '2025-01-10 04:34:09'),
(10, '2 w 1', 1, '2025-01-10 04:34:09'),
(11, 'MacBooki', 1, '2025-01-10 04:34:09'),
(12, 'Apple', 2, '2025-01-10 04:34:09'),
(13, 'Samsung', 2, '2025-01-10 04:34:09'),
(14, 'Xiaomi', 2, '2025-01-10 04:34:09'),
(15, 'Inne', 2, '2025-01-10 04:34:09'),
(16, 'PC do gier', 3, '2025-01-10 04:34:09'),
(17, 'All-in-One', 3, '2025-01-10 04:34:09'),
(18, 'Mini-PC', 3, '2025-01-10 04:34:09'),
(19, 'Telewizory', 4, '2025-01-10 04:34:09'),
(20, 'Soundbary', 4, '2025-01-10 04:34:09'),
(21, 'Projektory', 4, '2025-01-10 04:34:09'),
(22, 'Pralki', 5, '2025-01-10 04:34:09'),
(23, 'Lodówki', 5, '2025-01-10 04:34:09'),
(24, 'Zmywarki', 5, '2025-01-10 04:34:09'),
(25, 'Mikrofalówki', 5, '2025-01-10 04:34:09'),
(26, 'PlayStation', 6, '2025-01-10 04:34:09'),
(27, 'Xbox', 6, '2025-01-10 04:34:09'),
(28, 'Nintendo', 6, '2025-01-10 04:34:09'),
(29, 'Akcesoria', 6, '2025-01-10 04:34:09'),
(30, 'Słuchawki', 7, '2025-01-10 04:34:09'),
(31, 'Klawiatury', 7, '2025-01-10 04:34:09'),
(32, 'Myszy', 7, '2025-01-10 04:34:09'),
(33, 'Monitory', 7, '2025-01-10 04:34:09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `full_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `total_price`, `status`, `created_at`, `full_name`, `address`, `city`, `postal_code`, `phone_number`) VALUES
(31, 26, 18, 9599.98, 'completed', '2025-01-22 19:09:28', 'Jan Kowalski', 'Słoneczna 27', 'Lublin', '23-303', '123456789'),
(32, 26, NULL, 7999.99, 'pending', '2025-01-22 19:10:06', 'Jan Kowalski', 'Garbarska 20', 'Lublin', '20-340', '123456788'),
(33, 26, 18, 9499.99, 'pending', '2025-01-22 19:10:14', 'Jan Kowalski', 'Słoneczna 27', 'Lublin', '23-303', '123456789'),
(60, 10, 10, 1499.99, 'pending', '2025-01-10 19:20:16', 'User 1', 'ul. Słoneczna 23', 'Gdańsk', '80-001', '537-574-933'),
(61, 11, 12, 3299.50, 'completed', '2025-01-15 19:20:16', 'User 1', 'ul. Mickiewicza 12', 'Warszawa', '00-001', '517-181-551'),
(62, 12, 13, 2399.99, 'cancelled', '2025-01-10 19:20:16', 'User 2', 'ul. Długa 5', 'Poznań', '60-001', '586-853-695'),
(63, 13, 14, 5299.99, 'pending', '2025-01-12 19:20:16', 'User 2', 'ul. Krótka 8', 'Wrocław', '50-001', '586-553-832'),
(64, 14, 15, 2999.99, 'completed', '2025-01-21 19:20:16', 'User 3', 'ul. Mickiewicza 12', 'Łódź', '90-001', '525-229-646'),
(65, 15, 16, 1899.00, 'pending', '2025-01-16 19:20:16', 'User 3', 'ul. Jana Pawła II 10', 'Łódź', '90-001', '536-877-978'),
(66, 16, 17, 4599.99, 'cancelled', '2025-01-11 19:20:16', 'User 4', 'ul. Mickiewicza 12', 'Kraków', '30-001', '517-656-774'),
(67, 17, 18, 1299.00, 'pending', '2025-01-11 19:20:16', 'Jan Kowalski', 'Słoneczna 27', 'Lublin', '23-303', '123456789'),
(68, 18, NULL, 2599.00, 'completed', '2025-01-15 19:20:16', 'Jan Kowalski', 'Garbarska 20', 'Lublin', '20-340', '123456788'),
(69, 19, 26, 3999.99, 'completed', '2025-01-20 19:20:16', 'User 4', 'ul. Długa 5', 'Warszawa', '00-001', '576-732-845'),
(70, 20, 28, 3499.99, 'pending', '2025-01-18 19:20:16', 'User 5', 'ul. Krótka 8', 'Poznań', '60-001', '538-287-196'),
(71, 21, 29, 1799.99, 'completed', '2025-01-19 19:20:16', 'User 5', 'ul. Ogrodowa 32', 'Lublin', '20-001', '590-474-567'),
(72, 22, 30, 2499.99, 'cancelled', '2025-01-22 19:20:16', 'User 6', 'ul. Jana Pawła II 10', 'Wrocław', '50-001', '536-934-122'),
(73, 23, 31, 1899.50, 'pending', '2025-01-16 19:20:16', 'User 6', 'ul. Lipowa 45', 'Warszawa', '00-001', '527-859-344'),
(74, 24, 32, 5599.99, 'completed', '2025-01-18 19:20:16', 'User 7', 'ul. Słoneczna 23', 'Katowice', '40-001', '583-467-893'),
(75, 25, 33, 2499.00, 'pending', '2025-01-19 19:20:16', 'User 3', 'ul. Ogrodowa 32', 'Katowice', '40-001', '537-194-505'),
(76, 10, 10, 1499.99, 'pending', '2025-01-19 19:20:28', 'User 1', 'ul. Słoneczna 23', 'Gdańsk', '80-001', '537-574-933'),
(77, 11, 12, 3299.50, 'completed', '2025-01-20 19:20:28', 'User 1', 'ul. Mickiewicza 12', 'Warszawa', '00-001', '517-181-551'),
(78, 12, 13, 2399.99, 'cancelled', '2025-01-22 19:20:28', 'User 2', 'ul. Długa 5', 'Poznań', '60-001', '586-853-695'),
(79, 13, 14, 5299.99, 'pending', '2025-01-11 19:20:28', 'User 2', 'ul. Krótka 8', 'Wrocław', '50-001', '586-553-832'),
(80, 14, 15, 2999.99, 'completed', '2025-01-09 19:20:28', 'User 3', 'ul. Mickiewicza 12', 'Łódź', '90-001', '525-229-646'),
(81, 15, 16, 1899.00, 'pending', '2025-01-20 19:20:28', 'User 3', 'ul. Jana Pawła II 10', 'Łódź', '90-001', '536-877-978'),
(82, 16, 17, 4599.99, 'cancelled', '2025-01-19 19:20:28', 'User 4', 'ul. Mickiewicza 12', 'Kraków', '30-001', '517-656-774'),
(83, 17, 18, 1299.00, 'pending', '2025-01-14 19:20:28', 'Jan Kowalski', 'Słoneczna 27', 'Lublin', '23-303', '123456789'),
(84, 18, NULL, 2599.00, 'completed', '2025-01-19 19:20:28', 'Jan Kowalski', 'Garbarska 20', 'Lublin', '20-340', '123456788'),
(85, 19, 26, 3999.99, 'completed', '2025-01-14 19:20:28', 'User 4', 'ul. Długa 5', 'Warszawa', '00-001', '576-732-845'),
(86, 20, 28, 3499.99, 'pending', '2025-01-21 19:20:28', 'User 5', 'ul. Krótka 8', 'Poznań', '60-001', '538-287-196'),
(87, 21, 29, 1799.99, 'completed', '2025-01-11 19:20:28', 'User 5', 'ul. Ogrodowa 32', 'Lublin', '20-001', '590-474-567'),
(88, 22, 30, 2499.99, 'cancelled', '2025-01-11 19:20:28', 'User 6', 'ul. Jana Pawła II 10', 'Wrocław', '50-001', '536-934-122'),
(89, 23, 31, 1899.50, 'pending', '2025-01-16 19:20:28', 'User 6', 'ul. Lipowa 45', 'Warszawa', '00-001', '527-859-344'),
(90, 24, 32, 5599.99, 'completed', '2025-01-11 19:20:28', 'User 7', 'ul. Słoneczna 23', 'Katowice', '40-001', '583-467-893'),
(91, 25, 33, 2499.00, 'pending', '2025-01-10 19:20:28', 'User 3', 'ul. Ogrodowa 32', 'Katowice', '40-001', '537-194-505'),
(92, 10, 10, 1499.99, 'pending', '2025-01-19 19:20:33', 'User 1', 'ul. Słoneczna 23', 'Gdańsk', '80-001', '537-574-933'),
(93, 11, 12, 3299.50, 'completed', '2025-01-10 19:20:33', 'User 1', 'ul. Mickiewicza 12', 'Warszawa', '00-001', '517-181-551'),
(94, 12, 13, 2399.99, 'cancelled', '2025-01-11 19:20:33', 'User 2', 'ul. Długa 5', 'Poznań', '60-001', '586-853-695'),
(95, 13, 14, 5299.99, 'pending', '2025-01-18 19:20:33', 'User 2', 'ul. Krótka 8', 'Wrocław', '50-001', '586-553-832'),
(96, 14, 15, 2999.99, 'completed', '2025-01-20 19:20:33', 'User 3', 'ul. Mickiewicza 12', 'Łódź', '90-001', '525-229-646'),
(97, 15, 16, 1899.00, 'pending', '2025-01-22 19:20:33', 'User 3', 'ul. Jana Pawła II 10', 'Łódź', '90-001', '536-877-978'),
(98, 16, 17, 4599.99, 'cancelled', '2025-01-13 19:20:33', 'User 4', 'ul. Mickiewicza 12', 'Kraków', '30-001', '517-656-774'),
(99, 17, 18, 1299.00, 'pending', '2025-01-19 19:20:33', 'Jan Kowalski', 'Słoneczna 27', 'Lublin', '23-303', '123456789'),
(100, 18, NULL, 2599.00, 'completed', '2025-01-19 19:20:33', 'Jan Kowalski', 'Garbarska 20', 'Lublin', '20-340', '123456788'),
(101, 19, 26, 3999.99, 'completed', '2025-01-15 19:20:33', 'User 4', 'ul. Długa 5', 'Warszawa', '00-001', '576-732-845'),
(102, 20, 28, 3499.99, 'pending', '2025-01-11 19:20:33', 'User 5', 'ul. Krótka 8', 'Poznań', '60-001', '538-287-196'),
(103, 21, 29, 1799.99, 'completed', '2025-01-16 19:20:33', 'User 5', 'ul. Ogrodowa 32', 'Lublin', '20-001', '590-474-567'),
(104, 22, 30, 2499.99, 'cancelled', '2025-01-11 19:20:33', 'User 6', 'ul. Jana Pawła II 10', 'Wrocław', '50-001', '536-934-122'),
(105, 23, 31, 1899.50, 'pending', '2025-01-12 19:20:33', 'User 6', 'ul. Lipowa 45', 'Warszawa', '00-001', '527-859-344'),
(106, 24, 32, 5599.99, 'completed', '2025-01-16 19:20:33', 'User 7', 'ul. Słoneczna 23', 'Katowice', '40-001', '583-467-893'),
(107, 25, 33, 2499.00, 'pending', '2025-01-10 19:20:33', 'User 3', 'ul. Ogrodowa 32', 'Katowice', '40-001', '537-194-505'),
(108, 26, 18, 19999.97, 'pending', '2025-01-22 19:28:16', 'Jan Kowalski', 'Słoneczna 27', 'Lublin', '23-303', '123456789');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(37, 31, 49, 1, 4299.99),
(38, 31, 19, 1, 5299.99),
(39, 32, 20, 1, 7999.99),
(40, 33, 127, 1, 9499.99),
(143, 31, 5, 1, 1499.99),
(144, 31, 15, 2, 999.99),
(145, 31, 22, 1, 3299.50),
(146, 32, 8, 3, 2399.99),
(147, 32, 17, 1, 5299.99),
(148, 32, 30, 2, 2999.99),
(149, 33, 2, 1, 1899.00),
(150, 33, 4, 1, 4599.99),
(151, 33, 6, 2, 1299.00),
(152, 60, 10, 3, 2599.00),
(153, 60, 18, 2, 3999.99),
(154, 60, 9, 1, 3499.99),
(155, 61, 21, 2, 1799.99),
(156, 61, 25, 1, 2499.99),
(157, 61, 3, 1, 1899.50),
(158, 62, 12, 2, 5599.99),
(159, 62, 16, 3, 2499.00),
(160, 62, 19, 1, 1499.99),
(161, 63, 14, 2, 999.99),
(162, 63, 23, 1, 3299.50),
(163, 63, 28, 3, 2399.99),
(164, 64, 27, 1, 5299.99),
(165, 64, 32, 2, 2999.99),
(166, 64, 24, 1, 1899.00),
(167, 65, 11, 1, 4599.99),
(168, 65, 29, 2, 1299.00),
(169, 65, 13, 3, 2599.00),
(170, 66, 20, 2, 3999.99),
(171, 66, 26, 1, 3499.99),
(172, 66, 31, 2, 1799.99),
(173, 67, 7, 1, 2499.99),
(174, 67, 1, 1, 1899.50),
(175, 67, 33, 2, 5599.99),
(176, 68, 30, 3, 2499.00),
(177, 69, 5, 1, 1499.99),
(178, 70, 15, 2, 999.99),
(179, 71, 22, 1, 3299.50),
(180, 72, 8, 3, 2399.99),
(181, 73, 17, 1, 5299.99),
(182, 74, 30, 2, 2999.99),
(183, 75, 2, 1, 1899.00),
(184, 76, 4, 1, 4599.99),
(185, 77, 6, 2, 1299.00),
(186, 78, 10, 3, 2599.00),
(187, 79, 18, 2, 3999.99),
(188, 80, 9, 1, 3499.99),
(189, 81, 21, 2, 1799.99),
(190, 108, 67, 2, 6499.99),
(191, 108, 47, 1, 6999.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `main_image`, `created_at`, `category_id`, `stock`) VALUES
(1, 'Logitech MX Keys', 'Bezprzewodowa klawiatura z niskoprofilowymi klawiszami i podświetleniem, idealna do pracy biurowej.', 549.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 30),
(2, 'Razer BlackWidow V3', 'Mechaniczna klawiatura gamingowa z przełącznikami Green i podświetleniem RGB.', 649.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 22),
(3, 'Corsair K95 RGB Platinum', 'Zaawansowana klawiatura gamingowa z przełącznikami Cherry MX Speed i podświetleniem.', 999.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 18),
(4, 'SteelSeries Apex Pro', 'Klawiatura mechaniczna z regulowanymi przełącznikami OmniPoint.', 899.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 15),
(5, 'HyperX Alloy Origins', 'Mechaniczna klawiatura kompaktowa z przełącznikami HyperX Red.', 599.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 12),
(6, 'Logitech G915 TKL', 'Bezprzewodowa klawiatura mechaniczna o niskim profilu.', 899.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 20),
(7, 'Keychron K6', 'Bezprzewodowa klawiatura mechaniczna 65% z obsługą macOS i Windows.', 499.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 18),
(8, 'Ducky One 2 Mini', 'Klawiatura mechaniczna 60% z przełącznikami Cherry MX.', 549.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 25),
(9, 'Asus ROG Strix Scope RX', 'Gamingowa klawiatura z przełącznikami optycznymi ROG RX.', 799.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 10),
(10, 'Microsoft Surface Keyboard', 'Elegancka klawiatura bezprzewodowa zoptymalizowana dla urządzeń Surface.', 399.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 14),
(11, 'Roccat Vulcan 121 AIMO', 'Klawiatura gamingowa z unikalnymi przełącznikami Titan.', 699.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 8),
(12, 'Glorious GMMK', 'Modularna klawiatura mechaniczna pozwalająca na wymianę przełączników.', 749.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 16),
(13, 'Cooler Master SK622', 'Kompaktowa klawiatura mechaniczna bezprzewodowa.', 549.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 19),
(14, 'SteelSeries Apex 3', 'Membranowa klawiatura gamingowa z podświetleniem RGB.', 349.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 28),
(15, 'Anne Pro 2', 'Klawiatura mechaniczna 60% z obsługą Bluetooth.', 459.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 11),
(16, 'Keychron K8', 'Klawiatura mechaniczna TKL z obsługą Bluetooth.', 649.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 17),
(17, 'Dell XPS 13', 'Dell XPS 13 to lekki ultrabook z ekranem 13 cali, oferujący doskonałą wydajność i długi czas pracy na baterii. Idealny dla profesjonalistów i osób często podróżujących.', 6499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 0),
(18, 'HP Spectre x360', 'HP Spectre x360 to wszechstronny ultrabook z obracanym ekranem, który pozwala na korzystanie z niego jako laptopa lub tabletu. Wyposażony w szybki procesor i wysokiej jakości wyświetlacz.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 5),
(19, 'Asus ZenBook 14', 'Asus ZenBook 14 to ultrabook z ekranem OLED, zapewniający niesamowitą jakość obrazu i jasność. Lekki i stylowy, idealny dla osób ceniących elegancję i wydajność.', 5299.99, 'images/Ultrabooki.jpg', '2025-01-20 20:10:00', 8, 15),
(20, 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon to biznesowy ultrabook z wytrzymałą obudową i zaawansowanymi funkcjami bezpieczeństwa. Doskonały wybór dla profesjonalistów potrzebujących niezawodnego sprzętu.', 7999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 9),
(21, 'Acer Swift 3', 'Acer Swift 3 to ultrabook z procesorem AMD Ryzen, oferujący świetną wydajność i długi czas pracy na baterii w przystępnej cenie. Idealny dla studentów i osób pracujących zdalnie.', 3299.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 25),
(22, 'Microsoft Surface Laptop 4', 'Microsoft Surface Laptop 4 to elegancki ultrabook z doskonałym ekranem i komfortową klawiaturą. Oferuje płynną pracę oraz nowoczesny design, idealny do pracy i rozrywki.', 6999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 12),
(23, 'Samsung Galaxy Book Pro', 'Samsung Galaxy Book Pro to ultrabook z szybkim procesorem i długim czasem pracy na baterii. Wyposażony w wysokiej jakości wyświetlacz AMOLED, zapewniając doskonałe wrażenia wizualne.', 5899.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 8),
(24, 'Razer Book 13', 'Razer Book 13 to ultrabook stworzony z myślą o kreatywnych profesjonalistach. Oferuje wysoką wydajność, stylowy design oraz wytrzymałą konstrukcję, idealny do pracy w ruchu.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 20),
(25, 'LG Gram 14', 'LG Gram 14 to ultrabook znany ze swojej lekkości i wytrzymałości. Wyposażony w długi czas pracy na baterii oraz doskonały ekran, idealny dla osób często podróżujących.', 6299.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 7),
(26, 'Huawei MateBook X Pro', 'Huawei MateBook X Pro to ultrabook z niesamowitym ekranem 3K, zapewniającym wyraziste kolory i szczegółowość obrazu. Oferuje szybki procesor i stylowy design.', 8399.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 14),
(27, 'MSI Prestige 14', 'MSI Prestige 14 to ultrabook zaprojektowany dla profesjonalistów kreatywnych. Oferuje wysoką wydajność, precyzyjny ekran i elegancki design, idealny do pracy i rozrywki.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 9),
(28, 'Toshiba Tecra X50', 'Toshiba Tecra X50 to solidny ultrabook z wytrzymałą obudową i zaawansowanymi funkcjami bezpieczeństwa. Idealny dla biznesmenów potrzebujących niezawodnego sprzętu.', 6799.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 18),
(29, 'Panasonic Toughbook 55', 'Panasonic Toughbook 55 to ultrabook z wytrzymałą obudową, przystosowany do trudnych warunków pracy. Oferuje wysoką wydajność i długi czas pracy na baterii.', 8999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 3),
(30, 'Gigabyte Aero 15', 'Gigabyte Aero 15 to ultrabook dla profesjonalistów z branży kreatywnej. Wyposażony w potężny procesor i wysokiej jakości ekran, zapewnia doskonałą wydajność i jakość obrazu.', 9999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 5),
(31, 'Fujitsu Lifebook U938', 'Fujitsu Lifebook U938 to ultrabook zaprojektowany z myślą o mobilnych profesjonalistach. Oferuje lekkość, wytrzymałość oraz zaawansowane funkcje bezpieczeństwa.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 11),
(32, 'Huawei MateBook 13', 'Huawei MateBook 13 to ultrabook z szybkim procesorem i długim czasem pracy na baterii. Wyposażony w elegancki design i wysokiej jakości ekran, idealny do pracy i rozrywki.', 6799.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 22),
(33, 'Samsung Galaxy Book Flex', 'Samsung Galaxy Book Flex to ultrabook 2 w 1 z ekranem QLED, oferujący doskonałą jakość obrazu i elastyczność użytkowania jako laptopa lub tabletu.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 19),
(34, 'Dell Inspiron 15', 'Dell Inspiron 15 to solidny laptop dla codziennych użytkowników, oferujący niezawodną wydajność i wygodny ekran 15 cali. Idealny do pracy, nauki i rozrywki.', 3499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 20),
(35, 'HP Envy 13', 'HP Envy 13 to elegancki ultrabook z wydajnym procesorem i wysokiej jakości ekranem. Idealny dla osób ceniących styl i funkcjonalność, oferuje doskonałą wydajność w kompaktowej formie.', 5599.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 15),
(36, 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon to biznesowy ultrabook z wytrzymałą obudową i zaawansowanymi funkcjami bezpieczeństwa. Doskonały wybór dla profesjonalistów potrzebujących niezawodnego sprzętu.', 7999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 10),
(37, 'Acer Nitro 5', 'Acer Nitro 5 to gamingowy laptop z kartą graficzną RTX 3050, idealny dla graczy szukających wydajnego sprzętu. Oferuje wysoką wydajność i doskonałą jakość obrazu w przystępnej cenie.', 4999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 30),
(38, 'Alienware m17 R4', 'Alienware m17 R4 to zaawansowany gamingowy laptop z RTX 3080 i ekranem 17 cali, zapewniający niesamowitą wydajność i jakość obrazu. Idealny dla profesjonalnych graczy i entuzjastów gier.', 14999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 4),
(39, 'Razer Blade Stealth 13', 'Razer Blade Stealth 13 to lekki gamingowy ultrabook z RTX 3050 Ti, oferujący doskonałą mobilność i wydajność dla graczy. Stylowy design i potężne komponenty sprawiają, że jest idealny do gier w ruchu.', 8999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 12),
(40, 'MSI Prestige 14', 'MSI Prestige 14 to ultrabook zaprojektowany dla profesjonalistów kreatywnych. Oferuje wysoką wydajność, precyzyjny ekran i elegancki design, idealny do pracy i rozrywki.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 9),
(41, 'Toshiba Tecra X50', 'Toshiba Tecra X50 to solidny ultrabook z wytrzymałą obudową i zaawansowanymi funkcjami bezpieczeństwa. Idealny dla biznesmenów potrzebujących niezawodnego sprzętu.', 6799.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 18),
(42, 'Panasonic Toughbook 55', 'Panasonic Toughbook 55 to ultrabook z wytrzymałą obudową, przystosowany do trudnych warunków pracy. Oferuje wysoką wydajność i długi czas pracy na baterii, idealny dla profesjonalistów w terenie.', 8999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 3),
(43, 'Gigabyte Aero 15', 'Gigabyte Aero 15 to ultrabook dla profesjonalistów z branży kreatywnej. Wyposażony w potężny procesor i wysokiej jakości ekran, zapewnia doskonałą wydajność i jakość obrazu, idealny do obróbki grafiki i multimediów.', 9999.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 5),
(44, 'Fujitsu Lifebook U938', 'Fujitsu Lifebook U938 to ultrabook zaprojektowany z myślą o mobilnych profesjonalistach. Oferuje lekkość, wytrzymałość oraz zaawansowane funkcje bezpieczeństwa, idealny do pracy w ruchu.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 11),
(45, 'Huawei MateBook 13', 'Huawei MateBook 13 to ultrabook z szybkim procesorem i długim czasem pracy na baterii. Wyposażony w elegancki design i wysokiej jakości ekran, idealny do pracy i rozrywki.', 6799.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 22),
(46, 'Samsung Galaxy Book Flex', 'Samsung Galaxy Book Flex to ultrabook 2 w 1 z ekranem QLED, oferujący doskonałą jakość obrazu i elastyczność użytkowania jako laptopa lub tabletu. Wyposażony w szybki procesor i stylowy design.', 7499.99, 'images/Ultrabooki.jpg', '2025-01-08 20:10:00', 8, 19),
(47, 'Asus ROG Strix G15', 'Laptop gamingowy Asus ROG Strix G15 wyposażony w procesor AMD Ryzen 7, kartę graficzną NVIDIA RTX 3070 i ekran 144 Hz, idealny do wymagających gier.', 6999.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 11),
(48, 'Acer Predator Helios 300', 'Potężny laptop gamingowy z procesorem Intel Core i7, kartą graficzną NVIDIA RTX 3060 oraz podświetlaną klawiaturą RGB, zapewniający doskonałą jakość obrazu i płynność gry.', 6499.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 8),
(49, 'MSI GF63 Thin', 'Ultralekki laptop gamingowy MSI GF63 Thin z procesorem Intel i5 i kartą graficzną GTX 1650, oferujący świetną wydajność w kompaktowej obudowie.', 4299.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 19),
(50, 'Lenovo Legion 5', 'Gamingowy laptop Lenovo Legion 5 z procesorem AMD Ryzen 5, kartą RTX 3060 i chłodzeniem Coldfront 2.0, zapewniającym niskie temperatury podczas intensywnej rozgrywki.', 5699.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 10),
(51, 'Razer Blade 15', 'Wysokiej klasy laptop gamingowy z ekranem 144 Hz, procesorem Intel i7 i kartą graficzną NVIDIA RTX 3070, oferujący niesamowite wrażenia wizualne i wydajność.', 8999.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 15),
(52, 'Alienware m15 R6', 'Alienware m15 R6 to futurystyczny laptop gamingowy z ekranem 165 Hz, RTX 3070 i zaawansowanym chłodzeniem, zapewniającym maksymalną wydajność.', 10999.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 25),
(53, 'HP Omen 16', 'Laptop gamingowy HP Omen 16 z procesorem AMD Ryzen 7 i kartą graficzną NVIDIA RTX 3060, oferujący płynność rozgrywki i doskonałą jakość dźwięku.', 7499.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 18),
(54, 'Gigabyte Aorus 15G', 'Laptop Gigabyte Aorus 15G z mechaniczną klawiaturą i ekranem 240 Hz, idealny dla e-sportowców ceniących precyzję i wydajność.', 9999.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 10),
(55, 'Dell G15', 'Gamingowy laptop Dell G15 z mocnym procesorem Intel i5 i kartą graficzną RTX 3050, zapewniający dobrą jakość gier w przystępnej cenie.', 4599.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 5),
(56, 'Asus TUF Gaming A15', 'Solidny laptop gamingowy Asus TUF A15 z procesorem Ryzen 7 i kartą GTX 1660 Ti, wyposażony w trwałą konstrukcję i długą żywotność baterii.', 5799.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 22),
(57, 'MSI Pulse GL66', 'Laptop gamingowy MSI Pulse GL66 z ekranem 144 Hz, procesorem Intel i7 i kartą RTX 3060, oferujący niezrównaną płynność rozgrywki.', 7199.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 9),
(58, 'Razer Blade Stealth 13', 'Kompaktowy laptop gamingowy Razer Blade Stealth 13 z ekranem OLED, RTX 3050 Ti i ultramobilną konstrukcją.', 8499.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 3),
(59, 'Lenovo IdeaPad Gaming 3', 'Laptop gamingowy Lenovo IdeaPad Gaming 3 z procesorem Intel i5 i kartą GTX 1650, idealny dla początkujących graczy.', 3999.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 30),
(60, 'Alienware x17', 'Alienware x17 to potężny gamingowy laptop z ekranem 360 Hz, procesorem Intel i9 i kartą RTX 3080, oferujący najlepsze doświadczenie gamingowe.', 14999.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 12),
(61, 'Acer Nitro 5', 'Popularny laptop gamingowy Acer Nitro 5 z ekranem 120 Hz i kartą RTX 3050, oferujący świetną wydajność w przystępnej cenie.', 4799.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 40),
(62, 'HP Pavilion Gaming 15', 'Laptop HP Pavilion Gaming 15 z procesorem Intel i5 i kartą GTX 1650, idealny do codziennego grania i pracy.', 4299.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 7),
(63, 'MSI Katana GF76', 'Laptop MSI Katana GF76 z ekranem 144 Hz i kartą RTX 3050, zapewniający płynną rozgrywkę i wysoką jakość obrazu.', 5899.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 11),
(64, 'Asus ROG Zephyrus G14', 'Laptop Asus ROG Zephyrus G14 z Ryzen 9 i RTX 3060, łączący wydajność z kompaktowym designem.', 8599.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 14),
(65, 'Dell Alienware x15', 'Dell Alienware x15 to ultra-smukły laptop gamingowy z RTX 3070, zapewniający wysoką wydajność w kompaktowej obudowie.', 10999.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 6),
(66, 'Razer Blade 17', 'Gamingowy laptop Razer Blade 17 z ekranem 17 cali, RTX 3080 i klawiaturą mechaniczną, oferujący doskonałą jakość rozgrywki.', 12499.99, 'images/Gamingowe.jpg', '2025-01-08 20:10:00', 9, 2),
(67, 'iPhone 14 Pro', 'Najnowszy iPhone 14 Pro z ekranem OLED Super Retina, potrójnym aparatem 48 MP oraz procesorem A16 Bionic zapewniającym najwyższą wydajność.', 6499.99, 'images/apple.jpg', '2025-01-20 20:10:00', 12, 43),
(68, 'iPhone 13', 'iPhone 13 to niezawodny smartfon z chipem A15 Bionic, systemem iOS oraz podwójnym aparatem, zapewniający długą żywotność baterii.', 3999.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 20),
(69, 'iPhone SE 2022', 'iPhone SE 2022 to kompaktowy smartfon z czipem A15 Bionic oraz kompaktowym ekranem Retina HD o przekątnej 4,7 cala.', 2499.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 30),
(70, 'iPad Pro 12.9', 'Nowoczesny iPad Pro 12.9 z wyświetlaczem Liquid Retina XDR, obsługą Apple Pencil i procesorem M2.', 5999.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 25),
(71, 'iPad Air 2022', 'iPad Air 2022 wyposażony w wyświetlacz Liquid Retina 10,9 cala oraz czip M1 oferuje niesamowitą wydajność.', 3499.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 15),
(72, 'Apple Watch Series 8', 'Apple Watch Series 8 z funkcją EKG, pomiarem saturacji i łącznością LTE, doskonały do codziennego użytku.', 1999.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 35),
(73, 'AirPods Pro 2', 'Słuchawki bezprzewodowe Apple AirPods Pro 2 z aktywną redukcją szumów oraz doskonałą jakością dźwięku.', 1199.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 40),
(74, 'Mac Mini M2', 'Mac Mini z procesorem M2 to kompaktowy komputer stacjonarny o potężnej wydajności.', 3899.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 18),
(75, 'Apple TV 4K', 'Apple TV 4K to zaawansowane centrum multimedialne z obsługą Dolby Vision i Apple Arcade.', 999.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 25),
(76, 'iMac 24\" M1', 'Apple iMac 24\" z chipem M1 i doskonałym ekranem Retina 4.5K, zapewniający niesamowitą wydajność.', 6499.99, 'images/apple.jpg', '2025-01-08 20:10:00', 12, 20),
(77, 'Samsung Galaxy S23 Ultra', 'Samsung Galaxy S23 Ultra z ekranem Dynamic AMOLED 6.8 cala, aparatem 200 MP i rysikiem S-Pen to smartfon nowej generacji.', 6999.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 30),
(78, 'Samsung Galaxy S22', 'Galaxy S22 z procesorem Snapdragon 8 Gen 1, aparatem 50 MP oraz ekranem AMOLED 6.1 cala.', 3999.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 20),
(79, 'Samsung Galaxy Z Fold 4', 'Składany smartfon Samsung z ekranem Dynamic AMOLED oraz 12 GB RAM to przyszłość mobilności.', 8999.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 10),
(80, 'Samsung Galaxy Watch 5', 'Inteligentny zegarek z funkcją pomiaru EKG, ciśnienia krwi oraz nowoczesnym designem.', 1799.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 25),
(81, 'Samsung Galaxy Buds 2 Pro', 'Słuchawki bezprzewodowe z ANC i przestrzennym dźwiękiem 360°.', 899.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 15),
(82, 'Samsung QLED TV 65\"', 'Telewizor Samsung QLED 65\" z technologią Quantum Dot i 4K UHD.', 4299.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 12),
(83, 'Samsung Galaxy A53', 'Średniobudżetowy smartfon z ekranem Super AMOLED 120 Hz i aparatem 64 MP.', 1899.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 30),
(84, 'Samsung Galaxy Tab S8', 'Tablet z ekranem AMOLED 120 Hz i Snapdragon 8 Gen 1.', 3499.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 22),
(85, 'Samsung Galaxy S21 FE', 'Smartfon dla fanów serii Galaxy S z atrakcyjną ceną i potężnym Snapdragon 888.', 2899.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 15),
(86, 'Samsung Soundbar Q600A', 'Zaawansowany soundbar Dolby Atmos z mocnym basem.', 1299.99, 'images/samsung.jpg', '2025-01-08 20:10:00', 13, 18),
(87, 'Xiaomi 13 Pro', 'Xiaomi 13 Pro z procesorem Snapdragon 8 Gen 2, ekranem AMOLED LTPO 120 Hz i aparatem Leica 50 MP. Zapewnia doskonałe zdjęcia i płynne działanie systemu MIUI.', 4799.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 25),
(88, 'Redmi Note 12 Pro', 'Redmi Note 12 Pro z ekranem AMOLED 120 Hz, aparatem 108 MP oraz potężną baterią 5000 mAh. Idealny do codziennych zastosowań.', 1799.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 30),
(89, 'Xiaomi Mi 11 Ultra', 'Flagowy smartfon Xiaomi z ekranem AMOLED 1440p, aparatem 50 MP oraz baterią 5000 mAh.', 3799.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 12),
(90, 'Poco X4 Pro', 'Gamingowy smartfon z ekranem AMOLED 120 Hz, Snapdragonem 870 oraz dużą pojemnością baterii.', 1699.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 20),
(91, 'Xiaomi 12T', 'Nowoczesny smartfon z procesorem MediaTek Dimensity 8100 oraz ekranem AMOLED.', 3199.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 22),
(92, 'Mi Band 7', 'Inteligentna opaska sportowa Xiaomi Mi Band 7 z ekranem AMOLED, pomiarem tętna oraz ponad 110 trybami sportowymi.', 249.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 45),
(93, 'Xiaomi Watch S1', 'Elegancki smartwatch z obsługą NFC, ekranem AMOLED oraz funkcjami zdrowotnymi.', 999.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 32),
(94, 'Xiaomi Pad 5', 'Tablet z ekranem 120 Hz, głośnikami stereo oraz obsługą rysika stylus.', 2299.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 18),
(95, 'Xiaomi 11 Lite 5G', 'Smukły i lekki smartfon Xiaomi z procesorem Snapdragon 778G.', 1599.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 25),
(96, 'Redmi K50 Gaming', 'Smartfon gamingowy z systemem chłodzenia, ekranem AMOLED oraz procesorem Snapdragon 8 Gen 1.', 2999.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 15),
(97, 'Xiaomi Mi 10T Pro', 'Smartfon z ekranem 144 Hz, procesorem Snapdragon 865 i baterią 5000 mAh.', 2499.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 19),
(98, 'Poco M4 Pro', 'Średniobudżetowy smartfon z ekranem 90 Hz, podwójnym aparatem oraz długim czasem pracy na baterii.', 1099.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 28),
(99, 'Xiaomi TV P1 55\"', 'Smart TV z systemem Android TV, ekranem 4K UHD oraz obsługą Google Assistant.', 2699.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 10),
(100, 'Mi Router AX6000', 'Nowoczesny router WiFi 6 z technologią OFDMA i MU-MIMO.', 599.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 40),
(101, 'Xiaomi 11T Pro', 'Flagowiec z procesorem Snapdragon 888, szybkim ładowaniem 120W oraz doskonałym ekranem AMOLED.', 3499.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 22),
(102, 'Redmi Note 11', 'Popularny model z procesorem MediaTek Helio G88, ekranem IPS LCD oraz dużą baterią 5000 mAh.', 1299.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 37),
(103, 'Xiaomi Smart Air Purifier 4', 'Zaawansowany oczyszczacz powietrza z filtrami HEPA oraz obsługą aplikacji.', 899.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 26),
(104, 'Mi Smart Projector 2', 'Kompaktowy projektor z obrazem Full HD oraz dźwiękiem Dolby.', 1899.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 20),
(105, 'Xiaomi Electric Scooter Pro 2', 'Elektryczna hulajnoga z zasięgiem do 45 km i prędkością 25 km/h.', 2499.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 12),
(106, 'Mi True Wireless Earphones 2 Basic', 'Bezprzewodowe słuchawki douszne z dobrą jakością dźwięku i długą żywotnością baterii.', 199.99, 'images/xiaomi.jpg', '2025-01-08 20:10:00', 14, 50),
(107, 'Realme GT Neo 3', 'Smartfon z procesorem MediaTek Dimensity 8100, ekranem AMOLED 120 Hz oraz szybkim ładowaniem 150W.', 2499.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 28),
(108, 'OnePlus Nord 2', 'Średniopółkowy smartfon z doskonałym aparatem, ekranem AMOLED 90 Hz oraz procesorem Dimensity 1200.', 1999.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 22),
(109, 'Oppo Reno 8', 'Smartfon premium z potrójnym aparatem 64 MP, ekranem AMOLED i baterią 4500 mAh.', 2999.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 18),
(110, 'Vivo X90 Pro', 'Flagowiec z procesorem Snapdragon 8 Gen 2, ekranem AMOLED i aparatem Zeiss.', 4999.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 20),
(111, 'Sony Xperia 1 IV', 'Smartfon z ekranem 4K OLED 120 Hz, aparatem 12 MP oraz dźwiękiem Hi-Res.', 5499.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 15),
(112, 'Motorola Edge 30', 'Smartfon z ekranem pOLED 144 Hz, aparatem 50 MP oraz baterią 4800 mAh.', 2199.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 17),
(113, 'Realme 10 Pro', 'Smartfon ze Snapdragonem 695, ekranem IPS LCD 120 Hz oraz dużą baterią.', 1799.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 25),
(114, 'Asus ROG Phone 6', 'Gamingowy smartfon z systemem chłodzenia, Snapdragonem 8+ Gen 1 oraz ekranem AMOLED 165 Hz.', 4899.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 12),
(115, 'Huawei P50 Pro', 'Flagowiec z systemem HarmonyOS, aparatem Leica 50 MP oraz ekranem OLED.', 4699.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 10),
(116, 'Google Pixel 7', 'Smartfon z czystym Androidem, aparatem 50 MP i procesorem Tensor G2.', 3599.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 30),
(117, 'Nothing Phone 1', 'Telefon z unikalnym przezroczystym designem, ekranem OLED i aparatem 50 MP.', 2499.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 35),
(118, 'Nokia G50', 'Budżetowy smartfon z ekranem IPS, baterią 5000 mAh oraz Android One.', 999.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 48),
(119, 'Realme GT 2', 'Smartfon z ekranem AMOLED 120 Hz, Snapdragonem 888 i baterią 5000 mAh.', 2999.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 22),
(120, 'Oppo Find X5', 'Smartfon premium z aparatem Hasselblad, ekranem AMOLED i procesorem Snapdragon 888.', 4499.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 16),
(121, 'Vivo V23', 'Smartfon z ekranem AMOLED, potrójnym aparatem 64 MP oraz MediaTek Dimensity 920.', 2399.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 26),
(122, 'Sony Xperia 10 IV', 'Telefon ze Snapdragonem 695, ekranem OLED i baterią 5000 mAh.', 1999.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 28),
(123, 'Xiaomi Redmi 9C', 'Budżetowy smartfon z MediaTek Helio G35, ekranem 6.53\" i baterią 5000 mAh.', 899.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 32),
(124, 'Samsung Galaxy M32', 'Smartfon z ekranem Super AMOLED 90 Hz, MediaTek Helio G80 i potrójnym aparatem.', 1199.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 20),
(125, 'Motorola Moto G200', 'Smartfon ze Snapdragonem 888+, ekranem 144 Hz i baterią 5000 mAh.', 2399.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 19),
(126, 'Huawei Nova 9', 'Telefon z aparatem 50 MP, ekranem OLED 120 Hz oraz baterią 4300 mAh.', 2499.99, 'images/inne.jpg', '2025-01-08 20:10:00', 15, 23),
(127, 'Acer Predator Orion 5000', 'Mocny komputer gamingowy z procesorem Intel Core i7, kartą graficzną NVIDIA RTX 3080 oraz 32GB RAM.', 9499.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 19),
(128, 'Asus ROG Strix G10', 'Komputer z procesorem AMD Ryzen 7, kartą graficzną NVIDIA RTX 3060 oraz dyskiem SSD 1TB.', 6599.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 15),
(129, 'MSI Trident X', 'Kompaktowy komputer gamingowy z procesorem Intel Core i9, kartą RTX 4070 i 32GB RAM.', 11999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 8),
(130, 'HP Omen 25L', 'Komputer do gier z procesorem Intel Core i5, kartą graficzną RTX 2060 i 16GB RAM.', 5299.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 12),
(131, 'Lenovo Legion T5', 'Solidny PC z AMD Ryzen 5, kartą Radeon RX 6600 oraz dyskiem SSD 512GB.', 5499.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 18),
(132, 'Dell Alienware Aurora R13', 'Zaawansowany PC do gier z procesorem Intel Core i9, RTX 3090 oraz 64GB RAM.', 13999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 5),
(133, 'CyberPowerPC Gamer Xtreme', 'PC gamingowy z Intel Core i7, kartą NVIDIA GTX 1660 Ti oraz 16GB RAM.', 4799.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 22),
(134, 'iBUYPOWER Trace 4', 'Komputer gamingowy z procesorem AMD Ryzen 5, kartą RX 5500 XT i 8GB RAM.', 3699.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 14),
(135, 'Corsair One i300', 'Ultrakompaktowy komputer gamingowy z Intel Core i9, RTX 3080 i 32GB RAM.', 12999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 6),
(136, 'NZXT H1 Mini', 'Kompaktowy PC z procesorem Intel Core i7, RTX 3060 i 16GB RAM.', 6799.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 9),
(137, 'Skytech Blaze II', 'PC z AMD Ryzen 5, GTX 1660 i 16GB RAM.', 4399.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 11),
(138, 'ABS Gladiator', 'Komputer do gier z Intel Core i7, RTX 3060 Ti i dyskiem SSD 1TB.', 6999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 13),
(139, 'MSI Aegis RS', 'Gamingowy PC z AMD Ryzen 9, RTX 3080 oraz 32GB RAM.', 9999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 7),
(140, 'Alienware Aurora R12', 'PC z Intel Core i7, RTX 3070 i 32GB RAM.', 8999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 10),
(141, 'Lenovo IdeaCentre Gaming 5', 'Komputer gamingowy z AMD Ryzen 7, kartą GTX 1650 i 16GB RAM.', 3999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 20),
(142, 'ASUS TUF Gaming F15', 'Kompaktowy komputer gamingowy z Intel Core i5, RTX 3050 i 16GB RAM.', 5499.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 30),
(143, 'HP Pavilion Gaming TG01', 'Komputer dla graczy z procesorem AMD Ryzen 5, GTX 1650 i 8GB RAM.', 3499.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 19),
(144, 'CYBERPOWERPC Gamer Supreme', 'PC z Intel Core i9, RTX 3090 i 64GB RAM.', 15999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 4),
(145, 'Acer Nitro 50', 'Gamingowy komputer stacjonarny z AMD Ryzen 7, RTX 3070 i 16GB RAM.', 7999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 8),
(146, 'Maingear Vybe', 'Customowy komputer do gier z najnowszymi komponentami.', 12999.99, 'images/pc_do_gier.jpg', '2025-01-08 20:10:00', 16, 3),
(147, 'Apple iMac 24\" M1', 'Komputer All-in-One z ekranem Retina 4.5K, procesorem M1 i 8GB RAM.', 7499.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 12),
(148, 'Dell Inspiron 27 7000', 'All-in-One z ekranem 27\" FHD, procesorem Intel Core i7 i 16GB RAM.', 5999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 10),
(149, 'HP Pavilion 24', 'Komputer AiO z ekranem 24\" FHD, AMD Ryzen 5 i 8GB RAM.', 4299.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 14),
(150, 'Lenovo IdeaCentre AIO 5', 'All-in-One z ekranem 23,8\" i procesorem Intel Core i5.', 4599.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 8),
(151, 'Acer Aspire C27', 'Smukły AiO z ekranem 27\" i procesorem Intel Core i5.', 4999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 9),
(152, 'MSI Modern AM271', 'All-in-One z ekranem 27\" IPS i procesorem Intel Core i5.', 5699.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 6),
(153, 'Apple iMac 27\"', 'Komputer AiO z ekranem Retina 5K, procesorem Intel Core i9 i 16GB RAM.', 9999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 5),
(154, 'HP Envy 32', 'AiO z ekranem 32\" 4K i potężnym procesorem Intel Core i7.', 7899.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 15),
(155, 'ASUS Zen AiO 24', 'Komputer All-in-One z ekranem 23,8\" Full HD i procesorem Ryzen 7.', 6499.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 20),
(156, 'Lenovo Yoga A940', 'All-in-One z ekranem dotykowym 27\" 4K UHD i funkcją rysika.', 8999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 7),
(157, 'Dell OptiPlex 7780', 'Biznesowy komputer AiO z ekranem 27\" i procesorem Intel Core i5.', 5999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 9),
(158, 'Acer Chromebase 24', 'All-in-One z systemem Chrome OS, ekranem 24\" i procesorem Intel Core i3.', 3599.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 18),
(159, 'HP EliteOne 800', 'Komputer AiO do biura z ekranem 23,8\" Full HD.', 6299.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 11),
(160, 'Apple iMac Pro', 'Zaawansowany komputer AiO dla profesjonalistów, ekran Retina 5K.', 15999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 3),
(161, 'ASUS ExpertCenter AiO', 'All-in-One z ekranem 21,5\" i procesorem Intel Core i3.', 3999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 16),
(162, 'Samsung All-in-One PC', 'Stylowy komputer AiO z ekranem 27\" Full HD.', 5799.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 13),
(163, 'Microsoft Surface Studio 2', 'Zaawansowany AiO z ekranem dotykowym 28\".', 14999.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 4),
(164, 'Lenovo ThinkCentre M90a', 'Biznesowy komputer All-in-One z ekranem 23,8\".', 7199.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 8),
(165, 'HP ProOne 600 G6', 'All-in-One z ekranem 23,8\" Full HD i procesorem Intel Core i5.', 6499.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 14),
(166, 'Acer Veriton Z', 'Biznesowy komputer AiO z ekranem 23,8\" i procesorem Ryzen 5.', 5499.99, 'images/all_in_one.jpg', '2025-01-08 20:10:00', 17, 10),
(167, 'Intel NUC 11 Performance', 'Mini-PC z procesorem Intel Core i7, 16GB RAM i dyskiem SSD 512GB.', 3999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 15),
(168, 'Apple Mac Mini M2', 'Kompaktowy komputer z procesorem M2, 8GB RAM i 256GB SSD.', 4999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 12),
(169, 'ASUS PN50', 'Mini PC z procesorem AMD Ryzen 7, 16GB RAM i 512GB SSD.', 2999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 20),
(170, 'HP EliteDesk 800 Mini', 'Mini-PC dla firm z procesorem Intel Core i5 i 256GB SSD.', 3199.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 10),
(171, 'ZOTAC ZBOX Magnus', 'Gamingowy mini-PC z kartą graficzną RTX 3070.', 7999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 8),
(172, 'Dell OptiPlex 3090 Micro', 'Mini-komputer biznesowy z procesorem Intel Core i3.', 2899.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 14),
(173, 'Lenovo ThinkCentre M90q', 'Mini-PC do zastosowań profesjonalnych z procesorem Intel Core i7.', 5499.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 7),
(174, 'Acer Chromebox CXI4', 'Mini PC z systemem Chrome OS, idealny do edukacji.', 1899.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 18),
(175, 'ASRock DeskMini A300', 'Mini-PC dla entuzjastów, obsługa procesorów AMD Ryzen.', 2499.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 5),
(176, 'Intel NUC 10 Essential', 'Podstawowy mini-PC z procesorem Intel Celeron i 8GB RAM.', 1999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 22),
(177, 'MSI Cubi N JSL', 'Mini-komputer z procesorem Intel Pentium i 256GB SSD.', 2399.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 9),
(178, 'Beelink GT-R Mini', 'Kompaktowy mini-PC z procesorem Ryzen 5 i 16GB RAM.', 3499.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 13),
(179, 'Apple Mac Studio', 'Zaawansowany mini-komputer dla profesjonalistów z M1 Max.', 12999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 3),
(180, 'Chuwi CoreBox', 'Mini-PC z procesorem Intel Core i5, 8GB RAM i 256GB SSD.', 2799.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 16),
(181, 'Gigabyte Brix', 'Kompaktowy komputer z możliwością rozbudowy.', 3299.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 11),
(182, 'Intel NUC 12 Extreme', 'Mini-PC dla graczy z Intel Core i9 i RTX 3080.', 10999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 6),
(183, 'HP ProDesk 600 G6 Mini', 'Biznesowy mini-komputer z Windows 11.', 4299.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 15),
(184, 'ZOTAC ZBOX CI662', 'Bezwiatrakowy mini-PC z Intel Core i7.', 3799.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 10),
(185, 'ASUS Mini PC PN62', 'Mini PC z procesorem Intel Core i5.', 3599.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 9),
(186, 'Lenovo ThinkCentre Tiny-in-One', 'Modularny mini-PC z 24\" ekranem.', 4999.99, 'images/mini_pc.jpg', '2025-01-08 20:10:00', 18, 12),
(187, 'Samsung QLED Q80A', 'Telewizor 55-calowy z technologią QLED, rozdzielczość 4K UHD, HDR10+ i Smart TV.', 3999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 15),
(188, 'LG OLED C1', '65-calowy telewizor OLED z procesorem AI, Dolby Vision i Dolby Atmos.', 7999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 12),
(189, 'Sony Bravia XR A80J', 'Telewizor OLED 55 cali z rozdzielczością 4K, Google TV i dźwiękiem Acoustic Surface.', 6999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 10),
(190, 'Philips Ambilight PUS8506', 'Telewizor 50-calowy z podświetleniem Ambilight, Android TV i HDR10+.', 3499.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 8),
(191, 'TCL 55C725 QLED', 'Telewizor QLED 55 cali z systemem Android TV i obsługą Dolby Vision.', 2999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 20),
(192, 'Panasonic TX-50JX800E', '50-calowy telewizor LED z rozdzielczością 4K i obsługą HDR.', 2799.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 5),
(193, 'Samsung The Frame 2022', 'Unikalny telewizor 55 cali w formie obrazu z trybem sztuki.', 5999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 6),
(194, 'LG NanoCell NANO86', 'Telewizor 65-calowy z technologią NanoCell, 4K i AI Picture.', 4499.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 14),
(195, 'Sony X85J', '55-calowy telewizor LED z technologią Motionflow XR 120Hz.', 3799.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 8),
(196, 'Hisense 50A7100F', 'Telewizor 50 cali z rozdzielczością 4K i obsługą HDR.', 2399.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 9),
(197, 'Xiaomi Mi TV P1 43\"', 'Smart TV z Androidem, rozdzielczość 4K, obsługa Dolby Vision.', 1999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 16),
(198, 'Samsung Crystal UHD AU8000', 'Telewizor LED 55 cali z technologią Dynamic Crystal Color.', 2899.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 11),
(199, 'LG OLED G1', 'Galeria TV OLED z panelem evo 4K i AI ThinQ.', 9999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 3),
(200, 'Sony Bravia XR X90J', '65-calowy telewizor LED z procesorem Cognitive Processor XR.', 5599.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 7),
(201, 'Panasonic TX-65JZ2000E', 'Telewizor OLED z profesjonalną kalibracją obrazu.', 11999.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 2),
(202, 'Philips OLED 806', 'Smart TV 4K z technologią Ambilight 3-stronnego.', 7599.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 10),
(203, 'Samsung QN90A Neo QLED', 'Flagowy telewizor Samsung 4K z podświetleniem Mini LED.', 8499.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 4),
(204, 'LG 32LM6370PLA', 'Telewizor Full HD 32 cali z systemem WebOS.', 1299.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 18),
(205, 'TCL 43P615', 'Smart TV 43 cali z Android TV i HDR10.', 1799.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 21),
(206, 'Sony Bravia KD-32W800', 'Telewizor LED 32 cale z funkcjami smart TV.', 1499.99, 'images/telewizory.jpg', '2025-01-08 20:10:00', 19, 15),
(207, 'Samsung HW-Q800A', 'Soundbar 3.1.2 z technologią Dolby Atmos i DTS:X, idealny do kina domowego.', 2299.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 10),
(208, 'LG SN11RG', 'Soundbar 7.1.4 z dźwiękiem przestrzennym Dolby Atmos i subwooferem.', 3999.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 5),
(209, 'Sony HT-G700', '3.1-kanałowy soundbar z subwooferem i technologią Dolby Atmos.', 1999.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 8),
(210, 'Bose Smart Soundbar 700', 'Elegancki soundbar z obsługą Alexa i Google Assistant.', 3199.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 12),
(211, 'Yamaha YAS-209', 'Soundbar z technologią DTS Virtual:X i wbudowanym Alexa.', 1799.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 15),
(212, 'JBL Bar 5.1', 'Soundbar z odłączanymi głośnikami surround i mocnym basem.', 2599.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 9),
(213, 'Philips TAB8505', 'Soundbar 2.1 z subwooferem i technologią Dolby Atmos.', 1599.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 14),
(214, 'Samsung HW-Q950A', 'Soundbar 11.1.4 z technologią Dolby Atmos i Q-Symphony.', 5499.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 7),
(215, 'LG SN5Y', 'Soundbar 2.1-kanałowy z bezprzewodowym subwooferem.', 1299.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 11),
(216, 'Harman Kardon Citation Multibeam 700', 'Soundbar premium z wbudowanym Google Assistant.', 2999.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 13),
(217, 'Denon DHT-S216', '2.1-kanałowy soundbar z dekodowaniem DTS Virtual:X.', 1199.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 10),
(218, 'Sonos Beam Gen 2', 'Soundbar multiroom z obsługą AirPlay 2 i Dolby Atmos.', 2399.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 6),
(219, 'Polk Audio Signa S3', 'Soundbar z Chromecastem i subwooferem.', 1399.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 8),
(220, 'Sharp HT-SBW110', 'Soundbar 2.1 z bezprzewodowym subwooferem.', 899.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 20),
(221, 'Bose Soundbar 900', 'Zaawansowany soundbar z technologią Dolby Atmos.', 4999.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 4),
(222, 'Sony HT-S350', 'Soundbar 2.1 z bezprzewodowym subwooferem.', 1199.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 9),
(223, 'Samsung HW-T450', 'Soundbar 2.1-kanałowy z bezprzewodowym subwooferem.', 1099.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 15),
(224, 'LG SP8YA', 'Soundbar 3.1.2 z Dolby Atmos i Google Assistant.', 2499.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 11),
(225, 'Creative Stage V2', 'Niedrogi soundbar 2.1 do PC i telewizora.', 799.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 10),
(226, 'Denon Home Sound Bar 550', 'Kompaktowy soundbar z systemem multiroom HEOS.', 2799.99, 'images/soundbary.jpg', '2025-01-08 20:10:00', 20, 12),
(227, 'Epson EH-TW7100', 'Projektor 4K PRO-UHD idealny do kina domowego z HDR.', 6999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 12),
(228, 'BenQ W2700', 'Projektor 4K HDR z technologią DLP i szeroką paletą kolorów.', 6499.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 8),
(229, 'Optoma UHD38', 'Gamingowy projektor 4K UHD z niskim input lagiem.', 4999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 15),
(230, 'XGIMI Horizon Pro', 'Kompaktowy projektor 4K z systemem Android TV.', 5799.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 10),
(231, 'LG HU70LS', 'Projektor 4K UHD LED z webOS i funkcją Smart TV.', 6299.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 9),
(232, 'ViewSonic PX701-4K', 'Projektor 4K z wysoką jasnością 3200 ANSI lumenów.', 4299.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 14),
(233, 'Epson EH-TW9400', 'Zaawansowany projektor 4K PRO-UHD z HDR10 i szeroką paletą kolorów.', 9999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 6),
(234, 'BenQ TK850i', 'Projektor 4K HDR z Android TV i jasnością 3000 ANSI lumenów.', 6899.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 8),
(235, 'Sony VPL-VW290ES', 'Projektor 4K z technologią SXRD i HDR10.', 15999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 4),
(236, 'Acer H6810BD', 'Projektor 4K UHD o jasności 3500 ANSI lumenów.', 3999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 11),
(237, 'Optoma HD146X', 'Projektor Full HD do kina domowego z wysokim kontrastem.', 2899.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 7),
(238, 'LG PF50KS', 'Kompaktowy projektor LED Full HD z funkcją Smart TV.', 1999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 13),
(239, 'ViewSonic M1 Mini Plus', 'Kieszonkowy projektor LED z systemem Smart TV.', 999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 16),
(240, 'Anker Nebula Capsule II', 'Mini projektor z systemem Android TV.', 2099.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 5),
(241, 'Xiaomi Mi Smart Projector 2 Pro', 'Projektor Full HD z funkcją Smart TV.', 2999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 9),
(242, 'Epson EF-100B', 'Kompaktowy projektor laserowy o wysokiej jasności.', 3499.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 10),
(243, 'BenQ GV30', 'Mobilny projektor HD z dźwiękiem 2.1.', 1899.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 12),
(244, 'Optoma GT1080HDR', 'Projektor do gier z niskim opóźnieniem.', 3999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 8),
(245, 'Philips Screeneo U4', 'Projektor krótkiego rzutu Full HD.', 4999.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 7),
(246, 'Sony MP-CD1', 'Ultraprzenośny projektor do prezentacji.', 1599.99, 'images/projektory.jpg', '2025-01-08 20:10:00', 21, 11),
(247, 'Samsung WW90T554DAE', 'Pralka Samsung o pojemności 9 kg z technologią EcoBubble.', 2699.99, 'images/pralki.jpg', '2025-01-20 20:10:00', 22, 15),
(248, 'Bosch WAN28281PL', 'Pralka Bosch z systemem ActiveWater Plus i VarioPerfect.', 2199.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 10),
(249, 'LG F4WV709P1', 'Pralka LG o pojemności 9 kg z technologią AI DD.', 2999.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 12),
(250, 'Whirlpool FFB 8248 BV PL', 'Pralka Whirlpool z technologią FreshCare+ dla delikatnych tkanin.', 1899.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 9),
(251, 'Electrolux EW6F428WP', 'Pralka Electrolux z systemem SensiCare dla optymalnego zużycia energii.', 2399.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 8),
(252, 'Beko WUE7636X0A', 'Pralka Beko 7 kg z silnikiem inwerterowym ProSmart.', 1799.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 11),
(253, 'Indesit MTWE 71252 WK', 'Pralka Indesit z systemem Water Balance Plus.', 1499.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 6),
(254, 'Miele WSG 363', 'Ekskluzywna pralka Miele z systemem TwinDos i WiFi.', 4599.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 5),
(255, 'Siemens WM14N26XPL', 'Pralka Siemens 8 kg z technologią iSensoric.', 2899.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 7),
(256, 'Candy RO41276DWMCE', 'Pralka Candy Smart z funkcją sterowania aplikacją.', 1799.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 13),
(257, 'AEG L6FBG48SP', 'Pralka AEG 8 kg z technologią ProSense.', 2599.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 10),
(258, 'Hisense WFHV9014', 'Pralka Hisense 9 kg z funkcją opóźnionego startu.', 1999.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 12),
(259, 'Hotpoint-Ariston RSG 821', 'Pralka Hotpoint 8 kg z technologią Direct Injection.', 2099.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 8),
(260, 'TCL F704G70', 'Pralka TCL 7 kg z funkcją prania parowego.', 1599.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 9),
(261, 'Gorenje WEI843', 'Pralka Gorenje 8 kg z funkcją IonTech.', 1899.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 11),
(262, 'Sharp ES-HFB814AWC-EN', 'Pralka Sharp 8 kg z funkcją AllergySmart.', 1699.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 10),
(263, 'Bosch WAW32541PL', 'Pralka Bosch z systemem i-DOS i pojemnością 9 kg.', 3499.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 7),
(264, 'Samsung WW80T554DAT', 'Pralka Samsung 8 kg z funkcją AddWash.', 2499.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 9),
(265, 'LG F2WV5S8S0', 'Pralka LG Slim o pojemności 8,5 kg z technologią AI DD.', 2699.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 8),
(266, 'Indesit BTW A61052', 'Pralka ładowana od góry z funkcją Water Balance Plus.', 1499.99, 'images/pralki.jpg', '2025-01-08 20:10:00', 22, 6),
(267, 'Samsung RB38T776CB1', 'Lodówka Samsung z technologią SpaceMax i pojemnością 390L.', 3699.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 12),
(268, 'Bosch KGN49XLEA', 'Lodówka Bosch z systemem VitaFresh dla dłuższej świeżości.', 3899.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 10),
(269, 'LG GBB72MCDFN', 'Lodówka LG z funkcją DoorCooling+ i pojemnością 384L.', 3599.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 14),
(270, 'Whirlpool W7 931T OX', 'Lodówka Whirlpool NoFrost z funkcją 6. Zmysł.', 3299.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 9),
(271, 'Electrolux LNT7ME34X2', 'Lodówka Electrolux z systemem Cooling 360°.', 4199.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 11),
(272, 'Beko RCNA406E60ZXBN', 'Lodówka Beko HarvestFresh z technologią EverFresh+', 2899.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 13),
(273, 'Samsung RS68A8521S9', 'Lodówka side-by-side z technologią Twin Cooling Plus.', 5699.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 7),
(274, 'LG GSX960NSVZ', 'Lodówka z systemem InstaView i technologią Inverter Linear.', 7599.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 5),
(275, 'Amica FK3356.3GAA', 'Lodówka Amica z technologią No Frost i pojemnością 322L.', 2499.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 8),
(276, 'Samsung RB31FERNDSS', 'Lodówka Samsung z systemem All-Around Cooling.', 2999.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 10),
(277, 'Bosch KGN36KLEB', 'Lodówka Bosch z systemem NoFrost i komorą VitaFresh.', 3199.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 15),
(278, 'Sharp SJ-EX820F2-SL', 'Lodówka Sharp 2-drzwiowa z technologią Plasmacluster Ion.', 4599.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 6),
(279, 'Toshiba GR-RB360WE-DMJ(06)', 'Lodówka Toshiba No Frost z systemem Multi Air Flow.', 3499.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 8),
(280, 'Haier HB18FGSAAA', 'Lodówka Haier French Door z funkcją MyZone.', 5799.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 9),
(281, 'Siemens KG39NAXCF', 'Lodówka Siemens z komorą hyperFresh Plus.', 4299.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 11),
(282, 'Beko GNE490IR3V', 'Lodówka Beko side-by-side z technologią NeoFrost.', 5299.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 12),
(283, 'Miele KFN 29132 D', 'Lodówka Miele z systemem NoFrost i technologią DynaCool.', 6499.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 7),
(284, 'Vestfrost VR-FB373-2H0', 'Lodówka Vestfrost z funkcją IonTech.', 2899.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 14),
(285, 'Grundig GKNI 15740', 'Lodówka Grundig No Frost z wyświetlaczem LCD.', 3999.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 10),
(286, 'Candy CCE3T618FS', 'Lodówka Candy z klasą energetyczną A++.', 2099.99, 'images/lodowki.jpg', '2025-01-08 20:10:00', 23, 15),
(287, 'Bosch SMV6ZCX00E', 'Zmywarka Bosch z systemem PerfectDry oraz programem Silence.', 3499.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 12),
(288, 'Siemens SN636X03ME', 'Zmywarka Siemens z funkcją autoOpen Drying.', 3199.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 15),
(289, 'Whirlpool WFO3O41PLX', 'Zmywarka Whirlpool z technologią PowerClean Pro.', 2899.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 10),
(290, 'Beko DIN28431', 'Zmywarka Beko z programem AquaIntense oraz GlassShield.', 2399.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 8),
(291, 'Samsung DW60R7050BB', 'Zmywarka Samsung z systemem Zone Booster oraz Auto Open.', 3599.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 14),
(292, 'Electrolux EEM69310L', 'Zmywarka Electrolux z technologią ComfortLift.', 4499.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 9);
INSERT INTO `products` (`id`, `name`, `description`, `price`, `main_image`, `created_at`, `category_id`, `stock`) VALUES
(293, 'Candy CDPN 4D620PX', 'Zmywarka Candy z Wi-Fi i funkcją Smart Touch.', 2299.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 11),
(294, 'Miele G 5260 SCVi', 'Zmywarka Miele z funkcją AutoOpen Drying.', 5199.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 7),
(295, 'Grundig GNF41825X', 'Zmywarka Grundig z funkcją IonFresh.', 2699.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 13),
(296, 'Haier HWD100-BP14636', 'Zmywarka Haier z systemem Antibacterial Treatment.', 3599.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 5),
(297, 'Sharp QW-NI14I47EX-EN', 'Zmywarka Sharp z systemem IntelliWash.', 2599.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 12),
(298, 'Bosch SMS4HAW48E', 'Zmywarka Bosch z funkcją HomeConnect.', 3799.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 6),
(299, 'LG DFB325HS', 'Zmywarka LG z technologią QuadWash.', 4199.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 8),
(300, 'Siemens SN658X06TE', 'Zmywarka Siemens z systemem Zeolith Drying.', 4699.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 10),
(301, 'Amica DIM66C8EBOiH', 'Zmywarka Amica z funkcją SteamPower Pro.', 3199.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 14),
(302, 'Hisense HS661C60X', 'Zmywarka Hisense z programem EcoWash.', 2799.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 15),
(303, 'Indesit DIO3T131A', 'Zmywarka Indesit z funkcją Push&Go.', 2399.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 10),
(304, 'Samsung DW60M6050FS', 'Zmywarka Samsung z technologią WaterWall.', 3499.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 9),
(305, 'Bosch SPV4EKX20E', 'Zmywarka Bosch kompaktowa z funkcją TimeLight.', 2699.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 7),
(306, 'Beko DFS28131X', 'Zmywarka Beko wolnostojąca z systemem WaterSafe.', 2199.99, 'images/zmywarki.jpg', '2025-01-08 20:10:00', 24, 11),
(307, 'Samsung MC28H5015AW', 'Mikrofalówka Samsung z funkcją grilla i pojemnością 28L.', 599.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 20),
(308, 'LG MH6535GIS', 'Kuchenka mikrofalowa LG z technologią Smart Inverter.', 699.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 15),
(309, 'Bosch BEL554MS0', 'Mikrofalówka Bosch do zabudowy z funkcją AutoPilot.', 1299.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 10),
(310, 'Whirlpool MWPN 338 SB', 'Mikrofalówka Whirlpool z funkcją Crisp oraz 6th Sense.', 1199.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 12),
(311, 'Amica AMG20E70GV', 'Mikrofalówka Amica wolnostojąca z funkcją rozmrażania.', 349.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 18),
(312, 'Electrolux LMS2173EMX', 'Mikrofalówka Electrolux do zabudowy z funkcją grill.', 899.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 14),
(313, 'Beko MGF25210X', 'Mikrofalówka Beko z funkcją rozmrażania oraz pojemnością 25L.', 599.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 9),
(314, 'Sharp R843INW', 'Mikrofalówka Sharp z funkcją termoobiegu i grilla.', 749.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 11),
(315, 'Panasonic NN-GD37HBGTG', 'Mikrofalówka Panasonic z funkcją grilla i inverter.', 849.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 13),
(316, 'Miele M 6012 SC', 'Mikrofalówka Miele z wysoką mocą 900W i dużą pojemnością.', 1999.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 5),
(317, 'Hisense H20MOBS10', 'Mikrofalówka Hisense wolnostojąca z łatwym sterowaniem.', 499.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 17),
(318, 'Candy CMXW 22 DS', 'Mikrofalówka Candy z funkcją gotowania parowego.', 449.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 16),
(319, 'Gorenje BM235CLB', 'Mikrofalówka Gorenje do zabudowy z funkcją grill.', 1099.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 8),
(320, 'Zelmer ZMW2131X', 'Mikrofalówka Zelmer z timerem oraz łatwym sterowaniem.', 399.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 20),
(321, 'Haier HMW20MSS', 'Mikrofalówka Haier wolnostojąca o mocy 700W.', 369.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 10),
(322, 'Russell Hobbs RHM2076B', 'Mikrofalówka Russell Hobbs o eleganckim wyglądzie.', 549.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 18),
(323, 'Toshiba MW2-AG23PF', 'Mikrofalówka Toshiba z funkcją Eco oraz precyzyjnym timerem.', 499.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 14),
(324, 'Daewoo KOR-6S20B', 'Mikrofalówka Daewoo wolnostojąca o kompaktowym rozmiarze.', 299.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 12),
(325, 'Philips HD6360/20', 'Mikrofalówka Philips z nowoczesnym designem i grill.', 799.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 6),
(326, 'Caso MCG 25 Ceramic', 'Mikrofalówka Caso z ceramicznym dnem dla równomiernego podgrzewania.', 999.99, 'images/mikrofalowki.jpg', '2025-01-08 20:10:00', 25, 11),
(327, 'PlayStation 5', 'Konsola nowej generacji Sony PlayStation 5 z dyskiem SSD 825GB, wsparciem dla gier 4K.', 2499.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 20),
(328, 'PlayStation 5 Digital Edition', 'Wersja cyfrowa konsoli PS5 bez napędu dysków, przeznaczona dla graczy cyfrowych.', 2199.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 15),
(329, 'Sony DualSense', 'Bezprzewodowy kontroler DualSense dla PlayStation 5 z haptycznymi wibracjami.', 299.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 25),
(330, 'PlayStation VR2', 'Zestaw wirtualnej rzeczywistości nowej generacji dla PS5 z zaawansowanymi funkcjami.', 2399.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 12),
(331, 'FIFA 24 PS5', 'Nowa edycja popularnej gry sportowej FIFA 24 na konsolę PlayStation 5.', 289.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 10),
(332, 'Spider-Man 2 PS5', 'Przygody Spider-Mana na nowej generacji konsol PlayStation 5.', 269.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 18),
(333, 'PlayStation Plus 12 miesięcy', 'Abonament PlayStation Plus na 12 miesięcy umożliwiający granie online.', 249.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 30),
(334, 'Gran Turismo 7', 'Realistyczna gra wyścigowa na PlayStation 5 z zaawansowaną grafiką.', 319.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 14),
(335, 'Horizon Forbidden West', 'Gra akcji RPG z otwartym światem na konsolę PlayStation 5.', 279.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 16),
(336, 'PS5 Media Remote', 'Pilot multimedialny do PlayStation 5 umożliwiający łatwe sterowanie treściami.', 119.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 22),
(337, 'The Last of Us Part II', 'Gra akcji-przygodowa ekskluzywna dla konsoli PS5.', 259.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 9),
(338, 'Ratchet & Clank: Rift Apart', 'Platformówka 3D ekskluzywna dla konsoli PlayStation 5.', 249.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 14),
(339, 'God of War: Ragnarok', 'Nowa odsłona epickiej gry akcji na PS5.', 349.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 8),
(340, 'PS5 PULSE 3D Wireless Headset', 'Bezprzewodowy zestaw słuchawkowy zaprojektowany do gier PS5.', 479.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 15),
(341, 'Call of Duty: Modern Warfare III', 'Nowa odsłona popularnej serii strzelanek FPS na PS5.', 329.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 12),
(342, 'Ghost of Tsushima Director’s Cut', 'Ekskluzywna gra akcji dla PlayStation 5 z dodatkowymi treściami.', 259.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 18),
(343, 'Death Stranding Director’s Cut', 'Specjalne wydanie hitu Death Stranding na PS5.', 199.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 10),
(344, 'PS5 Charging Station', 'Stacja ładowania kontrolerów DualSense do PlayStation 5.', 159.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 20),
(345, 'Returnal', 'Ekskluzywna gra roguelike na PS5 z dynamiczną rozgrywką.', 249.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 7),
(346, 'Demon’s Souls Remake', 'Zremasterowana wersja klasycznej gry RPG akcji.', 299.99, 'images/playstation.jpg', '2025-01-08 20:10:00', 26, 9),
(347, 'Xbox Series X', 'Najwydajniejsza konsola Microsoft Xbox Series X z obsługą gier w jakości 4K.', 2499.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 18),
(348, 'Xbox Series S', 'Cyfrowa wersja konsoli nowej generacji Microsoft Xbox Series S.', 1599.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 25),
(349, 'Xbox Elite Wireless Controller Series 2', 'Zaawansowany kontroler Xbox Elite z wymiennymi elementami.', 799.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 12),
(350, 'FIFA 24 Xbox', 'Nowa edycja gry piłkarskiej FIFA 24 na konsolę Xbox Series X/S.', 289.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 14),
(351, 'Halo Infinite', 'Nowa odsłona kultowej serii strzelanek science fiction na Xbox.', 279.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 10),
(352, 'Forza Horizon 5', 'Gra wyścigowa z otwartym światem na konsolę Xbox Series X/S.', 319.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 15),
(353, 'Xbox Game Pass Ultimate 12 miesięcy', 'Abonament Xbox Game Pass Ultimate na 12 miesięcy.', 399.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 20),
(354, 'Cyberpunk 2077 Xbox', 'Futurystyczna gra RPG osadzona w otwartym świecie na Xbox.', 229.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 18),
(355, 'Gears 5', 'Gra akcji z serii Gears of War na konsolę Xbox.', 199.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 16),
(356, 'Xbox Wireless Headset', 'Bezprzewodowy zestaw słuchawkowy dla konsoli Xbox.', 499.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 9),
(357, 'Assassin’s Creed Valhalla', 'Gra RPG osadzona w czasach wikingów na Xbox.', 259.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 12),
(358, 'Microsoft Flight Simulator', 'Symulacja lotów na Xbox Series X.', 359.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 11),
(359, 'Xbox Series X Cooling Stand', 'Stacja chłodząca do konsoli Xbox Series X.', 149.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 8),
(360, 'Sea of Thieves', 'Gra przygodowa osadzona w świecie piratów.', 189.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 10),
(361, 'Xbox Series S Expansion Card 1TB', 'Dodatkowa pamięć masowa dla konsoli Xbox Series S.', 999.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 7),
(362, 'Call of Duty: Modern Warfare III Xbox', 'Nowa odsłona strzelanki FPS na konsolę Xbox.', 329.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 12),
(363, 'Red Dead Redemption 2', 'Gra akcji osadzona na Dzikim Zachodzie na Xbox.', 219.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 10),
(364, 'Watch Dogs Legion', 'Gra akcji z otwartym światem osadzona w futurystycznym Londynie.', 189.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 14),
(365, 'Elden Ring', 'Ekskluzywna gra RPG akcji na Xbox.', 299.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 13),
(366, 'Xbox Charging Station', 'Stacja ładowania kontrolerów do Xbox.', 129.99, 'images/xbox.jpg', '2025-01-08 20:10:00', 27, 18),
(367, 'Nintendo Switch OLED', 'Nowa wersja popularnej konsoli Nintendo Switch z ekranem OLED i lepszym dźwiękiem.', 1799.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 20),
(368, 'Nintendo Switch Lite', 'Lżejsza wersja konsoli Nintendo Switch przeznaczona do grania w podróży.', 999.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 15),
(369, 'The Legend of Zelda: Breath of the Wild', 'Ekskluzywna gra RPG na Nintendo Switch osadzona w magicznym świecie Hyrule.', 269.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 18),
(370, 'Mario Kart 8 Deluxe', 'Wyścigowa gra akcji z bohaterami Nintendo na Switch.', 249.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 25),
(371, 'Animal Crossing: New Horizons', 'Symulacja życia na malowniczej wyspie z unikalnym klimatem.', 229.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 14),
(372, 'Super Mario Odyssey', 'Nowa przygoda Mario w trójwymiarowym świecie pełnym wyzwań.', 259.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 17),
(373, 'Nintendo Switch Pro Controller', 'Profesjonalny kontroler bezprzewodowy do konsoli Nintendo Switch.', 289.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 9),
(374, 'Pokémon Scarlet', 'Nowa odsłona kultowej serii gier Pokémon na Nintendo Switch.', 219.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 12),
(375, 'Splatoon 3', 'Dynamiczna strzelanka multiplayer z unikalnym stylem rozgrywki.', 239.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 20),
(376, 'Metroid Dread', 'Ekskluzywna gra akcji sci-fi na Nintendo Switch.', 249.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 15),
(377, 'Nintendo Labo Variety Kit', 'Zestaw do budowania interaktywnych modeli kartonowych dla Nintendo Switch.', 199.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 18),
(378, 'Super Smash Bros. Ultimate', 'Bijatyka z bohaterami Nintendo na konsolę Switch.', 279.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 10),
(379, 'Ring Fit Adventure', 'Fitnessowa gra RPG na Nintendo Switch, łącząca zabawę z ćwiczeniami.', 319.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 14),
(380, 'Luigi’s Mansion 3', 'Przygodowa gra akcji z postacią Luigiego na konsolę Switch.', 239.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 16),
(381, 'Fire Emblem Engage', 'Strategiczna gra RPG z epicką historią.', 259.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 13),
(382, 'Mario Party Superstars', 'Imprezowa gra towarzyska na Nintendo Switch.', 199.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 22),
(383, 'Octopath Traveler II', 'Kolejna odsłona klasycznej gry RPG na Switch.', 249.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 11),
(384, 'Xenoblade Chronicles 3', 'Ekskluzywne RPG akcji na Nintendo Switch.', 279.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 10),
(385, 'Nintendo Switch Dock Set', 'Zestaw stacji dokującej do konsoli Nintendo Switch.', 349.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 8),
(386, 'Donkey Kong Country: Tropical Freeze', 'Kultowa platformówka akcji z Donkey Kongiem.', 219.99, 'images/nintendo.jpg', '2025-01-08 20:10:00', 28, 13),
(387, 'PDP Gaming Faceoff Deluxe+ Controller', 'Kontroler przewodowy do Nintendo Switch z możliwością personalizacji.', 149.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 18),
(388, 'Nintendo Switch Carrying Case', 'Etui ochronne na konsolę Nintendo Switch z dodatkowymi przegródkami.', 79.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 22),
(389, 'SanDisk 128GB microSDXC for Nintendo Switch', 'Oficjalna karta pamięci dla konsoli Nintendo Switch.', 139.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 30),
(390, 'HORI Split Pad Pro', 'Kontroler o ergonomicznym kształcie do wygodniejszej gry.', 249.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 25),
(391, 'Nintendo Switch Pro Charging Grip', 'Uchwyt ładowania dla kontrolerów Joy-Con.', 109.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 15),
(392, 'Joy-Con Wheel Pair', 'Zestaw dwóch uchwytów w formie kierownicy do Nintendo Switch.', 99.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 14),
(393, 'PowerA Joy-Con Charging Dock', 'Stacja dokująca do ładowania 4 kontrolerów Joy-Con jednocześnie.', 159.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 12),
(394, 'Nintendo Switch Adjustable Charging Stand', 'Regulowana podstawka ładująca dla Nintendo Switch.', 129.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 20),
(395, 'Hori Compact PlayStand', 'Kompaktowa podstawka do Nintendo Switch.', 69.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 16),
(396, 'Orzly Nintendo Switch Carry Case', 'Wzmocnione etui transportowe na Nintendo Switch.', 89.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 23),
(397, 'PowerA Everywhere Messenger Bag', 'Torba na konsolę Nintendo Switch i akcesoria.', 199.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 19),
(398, 'PDP Gaming LVL40 Wired Headset', 'Przewodowy zestaw słuchawkowy dedykowany dla Nintendo Switch.', 179.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 10),
(399, 'Nintendo Switch Joy-Con Grip', 'Standardowy uchwyt na kontrolery Joy-Con.', 79.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 8),
(400, 'Amiibo Figure - Link (Zelda Series)', 'Kolekcjonerska figurka Amiibo z serii Zelda.', 99.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 18),
(401, 'Nintendo Switch Tempered Glass Screen Protector', 'Hartowane szkło ochronne na ekran Nintendo Switch.', 49.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 27),
(402, 'PDP Travel Case for Nintendo Switch', 'Etui podróżne na Nintendo Switch z dodatkowymi przegródkami.', 119.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 13),
(403, 'HORI D-Pad Controller (L) Pikachu Edition', 'Alternatywny lewy Joy-Con z klasycznym D-Padem.', 129.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 20),
(404, 'Bigben Nintendo Switch Controller', 'Bezprzewodowy kontroler dla Nintendo Switch o klasycznym układzie przycisków.', 169.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 21),
(405, 'Nyko Portable Dock Kit', 'Kompaktowa stacja dokująca dla Nintendo Switch, idealna w podróży.', 209.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 10),
(406, 'FastSnail Grip Kit', 'Zestaw gripów poprawiających ergonomię kontrolerów Joy-Con.', 59.99, 'images/akcesoria.jpg', '2025-01-08 20:10:00', 29, 22),
(407, 'Sony WH-1000XM4', 'Bezprzewodowe słuchawki nauszne z aktywną redukcją szumów, zapewniające wyjątkową jakość dźwięku.', 1399.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 30),
(408, 'Bose QuietComfort 45', 'Wygodne słuchawki nauszne z technologią aktywnej redukcji hałasu.', 1299.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 25),
(409, 'Apple AirPods Pro', 'Słuchawki douszne z aktywną redukcją szumów i doskonałą jakością dźwięku.', 999.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 22),
(410, 'JBL Tune 750BTNC', 'Słuchawki bezprzewodowe z redukcją hałasu i głębokim basem.', 499.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 35),
(411, 'Beats Studio3 Wireless', 'Stylowe słuchawki nauszne z wysoką jakością dźwięku i długim czasem pracy.', 1299.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 20),
(412, 'Sennheiser HD 450BT', 'Słuchawki nauszne z technologią Bluetooth i ANC.', 899.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 15),
(413, 'Razer Kraken X', 'Przewodowe słuchawki gamingowe z lekką konstrukcją i przestrzennym dźwiękiem 7.1.', 349.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 18),
(414, 'HyperX Cloud II', 'Profesjonalne słuchawki gamingowe z mikrofonem i dźwiękiem przestrzennym.', 599.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 12),
(415, 'SteelSeries Arctis 7', 'Bezprzewodowe słuchawki dla graczy z 24-godzinnym czasem pracy na baterii.', 799.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 22),
(416, 'Samsung Galaxy Buds 2', 'Kompaktowe słuchawki douszne z doskonałą jakością dźwięku i redukcją szumów.', 749.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 30),
(417, 'Marshall Major IV', 'Słuchawki nauszne z wyrazistym dźwiękiem i retro designem.', 699.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 14),
(418, 'Bang & Olufsen Beoplay H95', 'Luksusowe słuchawki bezprzewodowe z aktywną redukcją szumów i bogatym brzmieniem.', 3499.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 6),
(419, 'Bowers & Wilkins PX7', 'Zaawansowane słuchawki z ANC i doskonałą jakością dźwięku.', 1799.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 10),
(420, 'Sony WF-1000XM4', 'Słuchawki douszne z redukcją szumów i długą żywotnością baterii.', 1299.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 25),
(421, 'Logitech G Pro X Wireless', 'Profesjonalne bezprzewodowe słuchawki gamingowe z mikrofonem Blue VO!CE.', 899.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 15),
(422, 'Edifier W800BT', 'Budżetowe słuchawki bezprzewodowe z długim czasem działania.', 249.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 30),
(423, 'Jabra Elite 85h', 'Inteligentne słuchawki bezprzewodowe z funkcją SmartSound.', 1099.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 12),
(424, 'Anker Soundcore Life Q30', 'Słuchawki z aktywną redukcją szumów w przystępnej cenie.', 499.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 18),
(425, 'Plantronics BackBeat PRO 2', 'Słuchawki z ANC i bardzo dobrym brzmieniem.', 899.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 9),
(426, 'Bose SoundSport Free', 'Bezprzewodowe słuchawki sportowe odporne na pot i wodę.', 849.99, 'images/sluchawki.jpg', '2025-01-08 20:10:00', 30, 27),
(427, 'Logitech MX Keys', 'Bezprzewodowa klawiatura z niskoprofilowymi klawiszami i podświetleniem, idealna do pracy biurowej.', 549.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 30),
(428, 'Razer BlackWidow V3', 'Mechaniczna klawiatura gamingowa z przełącznikami Green i podświetleniem RGB.', 649.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 22),
(429, 'Corsair K95 RGB Platinum', 'Zaawansowana klawiatura gamingowa z przełącznikami Cherry MX Speed i podświetleniem.', 999.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 18),
(430, 'SteelSeries Apex Pro', 'Klawiatura mechaniczna z regulowanymi przełącznikami OmniPoint.', 899.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 15),
(431, 'HyperX Alloy Origins', 'Mechaniczna klawiatura kompaktowa z przełącznikami HyperX Red.', 599.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 12),
(432, 'Logitech G915 TKL', 'Bezprzewodowa klawiatura mechaniczna o niskim profilu.', 899.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 20),
(433, 'Keychron K6', 'Bezprzewodowa klawiatura mechaniczna 65% z obsługą macOS i Windows.', 499.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 18),
(434, 'Ducky One 2 Mini', 'Klawiatura mechaniczna 60% z przełącznikami Cherry MX.', 549.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 25),
(435, 'Asus ROG Strix Scope RX', 'Gamingowa klawiatura z przełącznikami optycznymi ROG RX.', 799.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 10),
(436, 'Microsoft Surface Keyboard', 'Elegancka klawiatura bezprzewodowa zoptymalizowana dla urządzeń Surface.', 399.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 14),
(437, 'Roccat Vulcan 121 AIMO', 'Klawiatura gamingowa z unikalnymi przełącznikami Titan.', 699.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 8),
(438, 'Glorious GMMK', 'Modularna klawiatura mechaniczna pozwalająca na wymianę przełączników.', 749.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 16),
(439, 'Cooler Master SK622', 'Kompaktowa klawiatura mechaniczna bezprzewodowa.', 549.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 19),
(440, 'SteelSeries Apex 3', 'Membranowa klawiatura gamingowa z podświetleniem RGB.', 349.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 28),
(441, 'Anne Pro 2', 'Klawiatura mechaniczna 60% z obsługą Bluetooth.', 459.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 11),
(442, 'Keychron K8', 'Klawiatura mechaniczna TKL z obsługą Bluetooth.', 649.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 17),
(443, 'Apex Pro Mini', 'Klawiatura gamingowa z pełnym RGB i dynamicznym oprogramowaniem.', 729.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 24),
(444, 'Razer Huntsman Mini', 'Kompaktowa klawiatura z przełącznikami optycznymi.', 699.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 13),
(445, 'Cherry MX Board 3.0S', 'Profesjonalna klawiatura mechaniczna do biura i grania.', 649.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 20),
(446, 'ASUS TUF Gaming K3', 'Trwała klawiatura gamingowa z aluminiową obudową.', 449.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 30),
(449, 'Microsoft Surface Pro 9', 'Microsoft Surface Pro 9 to wszechstronny laptop 2 w 1 z ekranem dotykowym PixelSense oraz wydajnym procesorem Intel Core i7.', 7899.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 30),
(450, 'Lenovo Yoga 7i', 'Lenovo Yoga 7i to innowacyjny laptop konwertowalny z ekranem 14 cali, obsługą rysika i procesorem Intel Evo.', 5999.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 20),
(451, 'HP Spectre x360', 'HP Spectre x360 oferuje konwertowalną konstrukcję, ekran OLED, oraz stylowy, cienki profil z aluminium.', 7999.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 15),
(452, 'Dell Inspiron 14 2-in-1', 'Dell Inspiron 14 to laptop 2 w 1 z możliwością obrotu ekranu do 360 stopni, procesorem AMD Ryzen.', 4599.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 22),
(453, 'Acer Spin 5', 'Acer Spin 5 to wszechstronny laptop konwertowalny z ekranem dotykowym o wysokiej rozdzielczości.', 5299.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 10),
(454, 'Asus ZenBook Flip', 'Asus ZenBook Flip to elegancki laptop konwertowalny z ekranem NanoEdge oraz procesorem Intel Core.', 6299.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 35),
(455, 'Microsoft Surface Go 3', 'Surface Go 3 to kompaktowy i lekki laptop 2 w 1 z Windows 11, idealny do mobilnej pracy.', 3999.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 25),
(456, 'Lenovo Flex 5', 'Lenovo Flex 5 to wszechstronny laptop z konwertowalnym ekranem dotykowym oraz wysoką wydajnością.', 4199.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 8),
(457, 'HP Envy x360', 'HP Envy x360 to wszechstronny laptop 2 w 1 z ekranem Full HD oraz wydajnym procesorem AMD Ryzen.', 5799.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 14),
(458, 'Acer Chromebook Spin 713', 'Acer Chromebook Spin 713 to idealne urządzenie dla użytkowników Google Chrome OS.', 2899.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 40),
(459, 'Samsung Galaxy Book Flex', 'Samsung Galaxy Book Flex to elegancki laptop konwertowalny z ekranem QLED i rysikiem S-Pen.', 8499.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 18),
(460, 'Lenovo ThinkPad X1 Yoga', 'Lenovo ThinkPad X1 Yoga to najwyższej klasy ultrabook 2 w 1 z ekranem OLED i procesorem Intel i7.', 10299.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 10),
(461, 'Microsoft Surface Laptop Studio', 'Surface Laptop Studio to zaawansowane urządzenie 2 w 1 dla twórców i profesjonalistów.', 12999.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 5),
(462, 'Asus ROG Flow X13', 'Asus ROG Flow X13 to gamingowy laptop 2 w 1 z procesorem Ryzen 9 i grafiką RTX.', 11999.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 9),
(463, 'HP Elite Dragonfly', 'HP Elite Dragonfly to ultralekki laptop konwertowalny klasy premium z ekranem dotykowym.', 8999.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 12),
(464, 'Dell XPS 13 2-in-1', 'Dell XPS 13 2-in-1 to konwertowalny ultrabook o świetnym wyświetlaczu i kompaktowym designie.', 10299.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 7),
(465, 'Acer Aspire Spin 3', 'Acer Aspire Spin 3 to przystępny cenowo laptop 2 w 1 z ekranem dotykowym i podświetlaną klawiaturą.', 3399.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 27),
(466, 'Lenovo IdeaPad Flex 14', 'Lenovo IdeaPad Flex 14 oferuje doskonały stosunek jakości do ceny wśród laptopów 2 w 1.', 3899.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 15),
(467, 'Microsoft Surface Book 3', 'Surface Book 3 to potężne urządzenie 2 w 1 z odłączanym ekranem dotykowym i dedykowaną grafiką.', 12999.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 4),
(468, 'HP Pavilion x360', 'HP Pavilion x360 to przystępny cenowo laptop konwertowalny do codziennych zastosowań.', 4299.99, 'images/2w1.jpg', '2025-01-08 20:10:00', 10, 35),
(469, 'MacBook Air M2', 'MacBook Air M2 to ultralekki i wydajny laptop z nowym procesorem Apple M2, 13-calowym ekranem Retina oraz długim czasem pracy na baterii.', 6499.99, 'images/macbooki.jpg', '2025-01-20 20:10:00', 11, 30),
(470, 'MacBook Pro 14 M2', 'MacBook Pro 14 M2 oferuje profesjonalne możliwości z czipem M2, zaawansowanym ekranem Retina oraz nowoczesnym systemem chłodzenia.', 9999.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 12),
(471, 'MacBook Air M1', 'MacBook Air M1 to energooszczędny ultrabook z czipem Apple M1, ekranem Retina i bezgłośną pracą bez wentylatora.', 5399.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 22),
(472, 'MacBook Pro 16 M2 Pro', 'Nowy MacBook Pro 16 z procesorem M2 Pro zapewnia niesamowitą wydajność dla profesjonalistów i twórców treści.', 12999.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 10),
(473, 'MacBook Air 15 M2', 'MacBook Air 15 M2 to większa wersja popularnego modelu z nowoczesnym designem, ekranem Liquid Retina i dużą baterią.', 7299.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 15),
(474, 'MacBook Pro 13 M1', 'MacBook Pro 13 z czipem M1 oferuje wydajność na najwyższym poziomie, idealny do profesjonalnych zastosowań.', 7399.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 18),
(475, 'MacBook Pro 14 M1 Max', 'MacBook Pro 14 z czipem M1 Max to prawdziwa potęga w świecie laptopów, oferująca niesamowitą moc obliczeniową.', 14299.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 8),
(476, 'MacBook Pro 16 M1', 'Największy MacBook Pro 16 z czipem M1 oferuje doskonały ekran Retina i potężną baterię.', 11499.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 10),
(477, 'MacBook Air M2 Midnight', 'MacBook Air M2 Midnight w unikalnym kolorze i ultracienkiej konstrukcji, idealny do mobilnej pracy.', 6799.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 25),
(478, 'MacBook Pro 14 Space Gray', 'MacBook Pro 14 w wersji Space Gray to elegancki, potężny laptop z najlepszymi podzespołami.', 10299.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 5),
(479, 'MacBook Air M2 Starlight', 'Wersja Starlight MacBooka Air M2 oferuje unikalny design oraz ogromną wydajność dzięki nowemu czipowi.', 6799.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 40),
(480, 'MacBook Pro 13 Touch Bar', 'MacBook Pro 13 z paskiem Touch Bar dla wygodniejszej obsługi aplikacji i nowoczesnych rozwiązań.', 7899.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 12),
(481, 'MacBook Air M1 Gold', 'MacBook Air M1 Gold z eleganckim wyglądem oraz wysoką wydajnością procesora M1.', 5599.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 30),
(482, 'MacBook Pro 14 Silver', 'Klasyczny MacBook Pro 14 w kolorze srebrnym, doskonały do pracy biurowej oraz edycji treści.', 9999.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 16),
(483, 'MacBook Pro 16 Silver', 'MacBook Pro 16 Silver to doskonały laptop dla profesjonalistów z potężnym czipem M1 Max.', 13299.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 22),
(484, 'MacBook Air Retina', 'MacBook Air Retina to niezawodne urządzenie z ekranem wysokiej rozdzielczości Retina.', 4999.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 18),
(485, 'MacBook Pro 15', 'MacBook Pro 15 z ekranem Retina, 16GB RAM oraz potężnym procesorem Intel Core i7.', 8799.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 5),
(486, 'MacBook Air M2 Graphite', 'Wersja Graphite MacBooka Air M2 z czipem M2 i znakomitym ekranem Retina.', 6599.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 40),
(487, 'MacBook Pro 16 Max 64GB', 'Najmocniejszy MacBook Pro 16 M1 Max z 64GB RAM, idealny do najbardziej wymagających zadań.', 17999.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 3),
(488, 'MacBook Air M1 Silver', 'MacBook Air M1 w wersji Silver, oferujący fantastyczny design i potężną wydajność.', 5999.99, 'images/macbooki.jpg', '2025-01-08 20:10:00', 11, 29),
(489, 'Apex Pro Mini', 'Klawiatura gamingowa z pełnym RGB i dynamicznym oprogramowaniem.', 729.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 24),
(490, 'Razer Huntsman Mini', 'Kompaktowa klawiatura z przełącznikami optycznymi.', 699.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 13),
(491, 'Cherry MX Board 3.0S', 'Profesjonalna klawiatura mechaniczna do biura i grania.', 649.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 20),
(492, 'ASUS TUF Gaming K3', 'Trwała klawiatura gamingowa z aluminiową obudową.', 449.99, 'images/klawiatury.jpg', '2025-01-08 20:10:00', 31, 30),
(493, 'Dell UltraSharp U2723QE', 'Monitor 27-calowy 4K z technologią IPS Black zapewniającą głęboką czerń i szerokie kąty widzenia.', 2499.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 20),
(494, 'LG 27GL850-B', 'Gamingowy monitor 27-calowy QHD z technologią Nano IPS i odświeżaniem 144Hz.', 1799.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 15),
(495, 'Samsung Odyssey G7', 'Monitor zakrzywiony 32-calowy QHD 240Hz dla graczy z technologią Quantum Dot.', 3199.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 25),
(496, 'Asus ROG Swift PG259QN', 'Najlepszy monitor e-sportowy 24.5\" z odświeżaniem 360Hz i technologią G-Sync.', 2899.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 18),
(497, 'BenQ EX3501R', 'Zakrzywiony monitor ultrapanoramiczny 35-calowy QHD z HDR10.', 2699.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 12),
(498, 'Acer Predator XB273K', 'Gamingowy monitor 4K 144Hz z technologią G-Sync i HDR.', 4199.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 10),
(499, 'Philips 328E1CA', 'Monitor 32\" 4K zakrzywiony z matrycą VA i szeroką paletą kolorów.', 1899.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 22),
(500, 'MSI Optix MAG274QRF', 'Gamingowy monitor 27-calowy QHD 165Hz z niskim czasem reakcji.', 2099.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 19),
(501, 'Eizo ColorEdge CS2740', 'Profesjonalny monitor 27\" 4K dla grafików z 99% pokryciem AdobeRGB.', 7499.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 8),
(502, 'ViewSonic VX2758-2KP', 'Monitor 27\" QHD z technologią FreeSync i wysoką częstotliwością odświeżania.', 1499.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 11),
(503, 'Samsung Smart Monitor M7', 'Uniwersalny monitor 32-calowy 4K z wbudowanymi aplikacjami smart.', 1799.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 16),
(504, 'LG 34WN750-B', 'Ultrapanoramiczny monitor 34-calowy QHD IPS z technologią HDR10.', 2299.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 17),
(505, 'AOC C24G1', 'Zakrzywiony monitor gamingowy 24-calowy Full HD 144Hz.', 999.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 30),
(506, 'HP U28', 'Monitor 28\" 4K dla twórców z dokładnym odwzorowaniem kolorów.', 1999.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 21),
(507, 'Gigabyte AORUS FI32U', 'Gamingowy monitor 32-calowy 4K 144Hz z obsługą HDMI 2.1.', 3999.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 13),
(508, 'Dell P2421D', 'Biurkowy monitor 24\" QHD z technologią ComfortView i regulacją wysokości.', 1299.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 24),
(509, 'Razer Raptor 27', 'Gamingowy monitor 27\" QHD 165Hz z technologią Adaptive Sync.', 3799.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 14),
(510, 'Lenovo Legion Y44w', 'Ultrapanoramiczny monitor 44-calowy z odświeżaniem 144Hz.', 4999.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 12),
(511, 'Asus ProArt PA32UCX', 'Profesjonalny monitor 32\" 4K HDR dla twórców treści.', 8999.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 9),
(512, 'BenQ PD3200U', 'Monitor 32\" 4K dla profesjonalistów z precyzyjnym odwzorowaniem kolorów.', 2699.99, 'images/monitory.jpg', '2025-01-08 20:10:00', 33, 15),
(513, 'Logitech MX Master 3', 'Zaawansowana mysz bezprzewodowa z ergonomicznym kształtem i precyzyjnym czujnikiem Darkfield 4000 DPI.', 399.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 25),
(514, 'Razer DeathAdder V2', 'Gamingowa mysz z precyzyjnym sensorem optycznym 20,000 DPI i ergonomicznym designem.', 299.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 30),
(515, 'SteelSeries Rival 600', 'Mysz gamingowa z podwójnym czujnikiem TrueMove3+ i regulacją ciężaru.', 349.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 15),
(516, 'Logitech G502 HERO', 'Precyzyjna mysz dla graczy z sensorem HERO 16K i regulowanym ciężarem.', 279.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 20),
(517, 'Corsair Dark Core RGB Pro', 'Bezprzewodowa mysz gamingowa z niskim opóźnieniem i podświetleniem RGB.', 449.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 12),
(518, 'Zowie EC2', 'Profesjonalna mysz dla graczy e-sportowych z ergonomicznym designem.', 319.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 18),
(519, 'Razer Naga X', 'Mysz MMO z 16 programowalnymi przyciskami dla graczy MMORPG.', 399.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 14),
(520, 'HyperX Pulsefire Haste', 'Ultralekka mysz dla graczy FPS o wadze 59 g z sensorem Pixart 3335.', 249.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 22),
(521, 'Glorious Model O', 'Lekka mysz gamingowa o konstrukcji plastra miodu z precyzyjnym sensorem PMW3360.', 299.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 16),
(522, 'SteelSeries Aerox 3 Wireless', 'Ultralekka mysz bezprzewodowa z sensorem TrueMove Air.', 369.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 10),
(523, 'Cooler Master MM710', 'Ultralekka mysz gamingowa o wadze 53 g z sensorem PMW3389.', 229.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 11),
(524, 'Logitech G Pro X Superlight', 'Profesjonalna mysz bezprzewodowa dla e-sportowców, ważąca zaledwie 63 g.', 549.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 7),
(525, 'Microsoft Surface Arc', 'Elegancka mysz do pracy z funkcją składania dla łatwego transportu.', 299.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 9),
(526, 'Apple Magic Mouse 2', 'Bezprzewodowa mysz z technologią Multi-Touch dla komputerów Apple.', 399.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 12),
(527, 'Logitech M705 Marathon', 'Bezprzewodowa mysz o długim czasie pracy na baterii do biura.', 189.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 17),
(528, 'Razer Viper Ultimate', 'Mysz gamingowa bezprzewodowa z technologią HyperSpeed i sensorem 20K DPI.', 599.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 13),
(529, 'BenQ Zowie S1', 'Mysz zaprojektowana specjalnie dla graczy FPS z ergonomicznym designem.', 329.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 15),
(530, 'Corsair M65 RGB Elite', 'Mysz gamingowa FPS z aluminiową obudową i precyzyjnym sensorem 18K DPI.', 279.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 20),
(531, 'Asus ROG Spatha', 'Bezprzewodowa mysz gamingowa z 12 programowalnymi przyciskami.', 699.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 8),
(532, 'HP Omen Vector', 'Gamingowa mysz przewodowa z precyzyjnym sensorem 16K DPI.', 249.99, 'images/myszki.jpg', '2025-01-08 20:10:00', 32, 18);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `birth_date` date DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `role`, `birth_date`, `country`) VALUES
(5, 'admin', 'admin@gmail.com', '$2y$10$UvFCS/2F.BeWFJx5r0JliO7UoZu1RYtEXNjN6aDYW5YlGxN0xjwya', '2025-01-22 16:48:42', 'admin', '2003-01-17', 'PL'),
(6, 'Magdalena Król', 'user1@example.com', '$2y$10$exampleHashedPassword', '2025-01-18 20:50:45', 'user', '2002-12-07', 'Włochy'),
(7, 'Łukasz Szymański', 'user2@example.com', '$2y$10$exampleHashedPassword', '2025-01-19 17:04:45', 'user', '2002-10-16', 'Norwegia'),
(8, 'Tomasz Dąbrowski', 'user3@example.com', '$2y$10$exampleHashedPassword', '2025-01-18 00:24:45', 'user', '1984-09-03', 'Francja'),
(9, 'Łukasz Szymański', 'user4@example.com', '$2y$10$exampleHashedPassword', '2025-01-20 19:02:45', 'user', '1986-10-04', 'Włochy'),
(10, 'Anna Kowalska', 'user5@example.com', '$2y$10$exampleHashedPassword', '2025-01-18 23:02:45', 'user', '1999-03-28', 'Włochy'),
(11, 'Andrzej Kamiński', 'user6@example.com', '$2y$10$exampleHashedPassword', '2025-01-16 23:32:45', 'user', '1998-01-02', 'Hiszpania'),
(12, 'Joanna Pawlak', 'user7@example.com', '$2y$10$exampleHashedPassword', '2025-01-18 03:54:45', 'user', '1999-08-21', 'USA'),
(13, 'Magdalena Król', 'user8@example.com', '$2y$10$exampleHashedPassword', '2025-01-17 10:31:45', 'user', '1993-04-05', 'Dania'),
(14, 'Piotr Nowak', 'user9@example.com', '$2y$10$exampleHashedPassword', '2025-01-19 14:27:45', 'user', '1984-02-10', 'Hiszpania'),
(15, 'Patrycja Piotrowska', 'user10@example.com', '$2y$10$exampleHashedPassword', '2025-01-16 07:34:45', 'user', '2002-12-12', 'Włochy'),
(16, 'Grzegorz Kozłowski', 'user11@example.com', '$2y$10$exampleHashedPassword', '2025-01-22 21:07:45', 'user', '1985-08-24', 'Polska'),
(17, 'Grzegorz Kozłowski', 'user12@example.com', '$2y$10$exampleHashedPassword', '2025-01-23 05:26:45', 'user', '1999-07-22', 'Dania'),
(18, 'Barbara Woźniak', 'user13@example.com', '$2y$10$exampleHashedPassword', '2025-01-16 03:03:45', 'user', '1998-08-17', 'Szwecja'),
(19, 'Łukasz Szymański', 'user14@example.com', '$2y$10$exampleHashedPassword', '2025-01-23 08:12:45', 'user', '1983-10-16', 'Włochy'),
(20, 'Piotr Nowak', 'user15@example.com', '$2y$10$exampleHashedPassword', '2025-01-17 19:33:45', 'user', '1985-06-20', 'USA'),
(21, 'Monika Jankowska', 'user16@example.com', '$2y$10$exampleHashedPassword', '2025-01-21 10:07:45', 'user', '1996-08-20', 'Dania'),
(22, 'Magdalena Król', 'user17@example.com', '$2y$10$exampleHashedPassword', '2025-01-22 16:22:45', 'user', '1994-02-17', 'Włochy'),
(23, 'Piotr Nowak', 'user18@example.com', '$2y$10$exampleHashedPassword', '2025-01-18 15:57:45', 'user', '1996-06-23', 'USA'),
(24, 'Katarzyna Lewandowska', 'user19@example.com', '$2y$10$exampleHashedPassword', '2025-01-22 15:25:45', 'user', '1997-03-14', 'Norwegia'),
(25, 'Patrycja Piotrowska', 'user20@example.com', '$2y$10$exampleHashedPassword', '2025-01-17 01:56:45', 'user', '1994-05-05', 'Hiszpania'),
(26, 'test', 'test@gmail.com', '$2y$10$gU.eyDH5hh1qgH858SWy7eb/Dpyy65JVEof5o3tg4gdtXPwfZ/fOW', '2025-01-22 19:08:29', 'user', '2000-05-24', 'PL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `full_name`, `address`, `city`, `postal_code`, `phone_number`, `created_at`) VALUES
(10, 10, 'User 1', 'ul. Słoneczna 23', 'Gdańsk', '80-001', '537-574-933', '2025-01-22 19:13:57'),
(11, 10, 'User 1', 'ul. Lipowa 45', 'Gdańsk', '80-001', '585-127-947', '2025-01-22 19:13:57'),
(12, 11, 'User 1', 'ul. Mickiewicza 12', 'Warszawa', '00-001', '517-181-551', '2025-01-22 19:13:57'),
(13, 12, 'User 2', 'ul. Długa 5', 'Poznań', '60-001', '586-853-695', '2025-01-22 19:13:57'),
(14, 13, 'User 2', 'ul. Krótka 8', 'Wrocław', '50-001', '586-553-832', '2025-01-22 19:13:57'),
(15, 13, 'User 3', 'ul. Mickiewicza 12', 'Łódź', '90-001', '525-229-646', '2025-01-22 19:13:57'),
(16, 13, 'User 3', 'ul. Jana Pawła II 10', 'Łódź', '90-001', '536-877-978', '2025-01-22 19:13:57'),
(17, 15, 'User 4', 'ul. Mickiewicza 12', 'Kraków', '30-001', '517-656-774', '2025-01-22 19:13:57'),
(18, 26, 'Jan Kowalski', 'Słoneczna 27', 'Lublin', '23-303', '123456789', '2025-01-22 19:09:28'),
(26, 14, 'User 4', 'ul. Długa 5', 'Warszawa', '00-001', '576-732-845', '2025-01-22 19:13:57'),
(28, 16, 'User 5', 'ul. Krótka 8', 'Poznań', '60-001', '538-287-196', '2025-01-22 19:13:57'),
(29, 17, 'User 5', 'ul. Ogrodowa 32', 'Lublin', '20-001', '590-474-567', '2025-01-22 19:13:57'),
(30, 17, 'User 6', 'ul. Jana Pawła II 10', 'Wrocław', '50-001', '536-934-122', '2025-01-22 19:13:57'),
(31, 17, 'User 6', 'ul. Lipowa 45', 'Warszawa', '00-001', '527-859-344', '2025-01-22 19:13:57'),
(32, 17, 'User 7', 'ul. Słoneczna 23', 'Katowice', '40-001', '583-467-893', '2025-01-22 19:13:57'),
(33, 14, 'User 3', 'ul. Ogrodowa 32', 'Katowice', '40-001', '537-194-505', '2025-01-22 19:13:57'),
(34, 26, 'Jan Kowalski', 'Nadbystrzycka 38B', 'Lublin', '20-200', '123456787', '2025-01-22 21:02:50');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_orders_address_id` (`address_id`);

--
-- Indeksy dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_addresses_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_address_id` FOREIGN KEY (`address_id`) REFERENCES `user_addresses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `fk_user_addresses_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
