# Shop-php
## Tematyka projektu: Sklep internetowy z elektroniką

## Autor: Łukasz Krawczyk

## Funkcjonalności dla użytkownika (User):
   - Rejestracja i logowanie użytkowników
   - Zarządzanie adresami dostawy (dodawanie, edycja, usuwanie)
   - Przegląd historii zamówień i ich szczegółów
   - Przegląd produktów według kategorii i podkategorii
   - Wyszukiwanie produktów po nazwie i kategorii
   - Szczegółowy podgląd produktu (zdjęcia, opis, dostępność)
   - Dodawanie produktów do koszyka
   - Składanie zamówień z wyborem adresu dostawy
   - Podgląd szczegółów zamówienia - Status zamówienia: „Oczekujące”, „Zrealizowane”, „Anulowane”

## Funkcjonalności dla administratora (Admin):
 	 Po zalogowaniu administrator automatycznie jest przekierowywany do panelu administracyjnego.
   - Zarządzanie produktami
   			- Dodawanie, edytowanie i usuwanie produktów
          - Przypisywanie produktów do kategorii i podkategorii
          - Możliwość filtrowania i wyszukiwania produktów
   			- Zarządzanie stanem magazynowym
          - Obsługa zdjęć produktów
   - Zarządzanie użytkownikami
          - Przegląd listy użytkowników
          - Wyszukiwanie użytkowników
          - Edycja danych użytkownika (rola)
          - Usuwanie użytkowników (z zachowaniem historii zamówień)
   - Zarządzanie zamówieniami
          - Podgląd listy zamówień z możliwością filtrowania według statusu
          - Zmiana statusu zamówienia (np. z „Oczekujące” na „Zrealizowane”)
          - Anulowanie zamówienia (zwrot produktów na stan magazynowy)
          - Przegląd szczegółów zamówienia
   - Panel administratora - Dashboard
          - Liczba zarejestrowanych użytkowników
          - Liczba zamówień (oczekujących, anulowanych, zrealizowanych)
          - Najczęściej kupowane produkty
          - Wykresy sprzedaży dla określonych okresów


## Narzędzia i technologie:
   - Backend: PHP 8.x, MySQL (PDO), Apache
   - Frontend: HTML, CSS, JavaScript - w bardzo małej ilości (jQuery)
   - Framework: Brak (czysty PHP)
   - Baza danych: MySQL (zarządzana za pomocą PHPMyAdmin)
   - Projekt został zrealizowany zgodnie z wzorcem projektowym MVC


## Uruchomienie
1. Pobrany folder projektu należy umieścić w `XAMPP\htdocs`
2. Włączyć XAMPP MySQL Database oraz Apache Web Server
3. Zaimportować bazę danych shop poprzez narzędzie phpMyAdmin (plik database/shop.sql dołączony do projektu)
4. Uruchomienie aplikacji w przeglądarce pod adresem: `localhost:8000`



## Konta testowe
-   **Admin**
    -   Login: admin@gmail.com
    -   Hasło: Admin123!
-   **Test**
    -   Login: test@gmail.com
    -   Hasło: Test123!
