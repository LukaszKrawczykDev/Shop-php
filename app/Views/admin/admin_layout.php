<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <title>Panel Administratora</title>
  <link rel="stylesheet" href="../public/css/styles_adminn.css">
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />
</head>
<body>

<header class="admin-header">
  <div class="admin-logo">
    <a href="index.php?controller=Admin&action=dashboard">
      <img src="images/logo.svg" alt="Logo" class="my-logo" />
    </a>
    <h1>Panel Administratora - TechPlanet</h1>
  </div>
  <div class="admin-logout">
    <a href="index.php?controller=User&action=logout" class="btn-logout">Wyloguj</a>
  </div>
</header>

<div class="admin-container">
  <aside class="admin-sidebar">
    <ul>
      <li><a href="index.php?controller=Admin&action=dashboard">Dashboard</a></li>
      <li><a href="index.php?controller=Admin&action=productsList">Produkty</a></li>
      <li><a href="index.php?controller=Admin&action=usersList">Użytkownicy</a></li>
      <li><a href="index.php?controller=Admin&action=ordersList">Zamówienia</a></li>
    </ul>
  </aside>

  <main class="admin-content">
    <?php
      if (isset($adminView)) {
          include $adminView;
      }
    ?>
  </main>
</div>

</body>
</html>