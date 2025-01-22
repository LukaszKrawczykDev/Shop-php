<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <title>TechPlanet - Sklep</title>
  <link rel="stylesheet" href="../public/css/styles.css" />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />
</head>
<body>
<header class="topbar">
  <div class="topbar-container">
    <div class="logo-name">
      <a href="index.php">
        <img src="images/logo.svg" alt="TechPlanet Logo" class="my-logo" />
      </a>
      <a href="index.php" class="brand-name">TechPlanet</a>
    </div>

    <div class="search-bar">
    <form action="index.php" method="GET" class="search-form">
        <input type="hidden" name="controller" value="Product">
        <input type="hidden" name="action" value="search">
        <input type="text" name="query" placeholder="Szukaj produktów..." required>
        <button type="submit"><i class="fa fa-search" style="font-size: 20px"></i></button>
    </form>
    </div>

    <div class="account-actions">
      <?php if (isset($_SESSION['user_id'])): ?>
        <div class="user-dropdown">
          <a href="#" class="user-name" style="font-size: 18px;">
            <i class="fa fa-user" style="font-size: 20px; vertical-align: middle;"></i> Mój profil
          </a>
          <ul class="dropdown">
            <li><a href="index.php?controller=Address&action=list">Moje Adresy</a>
            <li><a href="index.php?controller=Order&action=myOrders">Moje zamówienia</a></li>
            <li><a href="index.php?controller=User&action=logout">Wyloguj</a></li>
          </ul>
        </div>
        <a href="index.php?controller=Cart&action=view" style="font-size: 18px;">
          <i class="fa fa-shopping-cart" style="font-size: 20px; vertical-align: middle;"></i> Koszyk
        </a>
      <?php else: ?>
        <a href="index.php?controller=User&action=login">Zaloguj</a>
        <a href="index.php?controller=User&action=register">Rejestracja</a>
        <a href="index.php?controller=Cart&action=view">
          <i class="fa fa-shopping-cart" style="font-size: 20px;"></i> Koszyk (0)
        </a>
      <?php endif; ?>
    </div>
  </div>
</header>

<nav class="category-nav">
  <ul>
    <li>
      <a href="index.php?controller=Category&action=show&id=1">Laptopy</a>
      <ul class="dropdown">
        <li><a href="index.php?controller=Category&action=show&id=8">Ultrabooki</a></li>
        <li><a href="index.php?controller=Category&action=show&id=9">Gamingowe</a></li>
        <li><a href="index.php?controller=Category&action=show&id=10">2 w 1</a></li>
        <li><a href="index.php?controller=Category&action=show&id=11">MacBooki</a></li>
      </ul>
    </li>
    <li>
      <a href="index.php?controller=Category&action=show&id=2">Smartfony</a>
      <ul class="dropdown">
        <li><a href="index.php?controller=Category&action=show&id=12">Apple</a></li>
        <li><a href="index.php?controller=Category&action=show&id=13">Samsung</a></li>
        <li><a href="index.php?controller=Category&action=show&id=14">Xiaomi</a></li>
        <li><a href="index.php?controller=Category&action=show&id=15">Inne</a></li>
      </ul>
    </li>
    <li>
      <a href="index.php?controller=Category&action=show&id=3">Komputery</a>
      <ul class="dropdown">
        <li><a href="index.php?controller=Category&action=show&id=16">PC do gier</a></li>
        <li><a href="index.php?controller=Category&action=show&id=17">All-in-one</a></li>
        <li><a href="index.php?controller=Category&action=show&id=18">Mini-pc</a></li>
      </ul>
    </li>
    <li>
      <a href="index.php?controller=Category&action=show&id=4">RTV</a>
      <ul class="dropdown">
        <li><a href="index.php?controller=Category&action=show&id=19">Telewizory</a></li>
        <li><a href="index.php?controller=Category&action=show&id=20">Soundbary</a></li>
        <li><a href="index.php?controller=Category&action=show&id=21">Projektory</a></li>

      </ul>
    </li>
    <li>
      <a href="index.php?controller=Category&action=show&id=5">AGD</a>
      <ul class="dropdown">
        <li><a href="index.php?controller=Category&action=show&id=22">Pralki</a></li>
        <li><a href="index.php?controller=Category&action=show&id=23">Lodówki</a></li>
        <li><a href="index.php?controller=Category&action=show&id=24">Zmywarki</a></li>
        <li><a href="index.php?controller=Category&action=show&id=25">Mikrofalówki</a></li>
      </ul>
    </li>
    <li>
      <a href="index.php?controller=Category&action=show&id=6">Konsole</a>
      <ul class="dropdown">
        <li><a href="index.php?controller=Category&action=show&id=26">Playstation</a></li>
        <li><a href="index.php?controller=Category&action=show&id=27">Xbox</a></li>
        <li><a href="index.php?controller=Category&action=show&id=28">Ninendo</a></li>
        <li><a href="index.php?controller=Category&action=show&id=29">Akcesoria</a></li>
      </ul>
    </li>
    <li>
      <a href="index.php?controller=Category&action=show&id=7">Akcesoria</a>
      <ul class="dropdown">
        <li><a href="index.php?controller=Category&action=show&id=30">Słuchawki</a></li>
        <li><a href="index.php?controller=Category&action=show&id=31">Klawiatury</a></li>
        <li><a href="index.php?controller=Category&action=show&id=32">Myszki</a></li>
        <li><a href="index.php?controller=Category&action=show&id=33">Monitory</a></li>
      </ul>
    </li>
  </ul>
</nav>
