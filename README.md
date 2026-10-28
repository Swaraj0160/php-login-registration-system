# Secure PHP & MySQL Authentication System

[![PHP Version](https://img.shields.io/badge/PHP-7.4%20%2F%208.x-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/MySQL-5.7%2B%20%2F%208.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Security](https://img.shields.io/badge/Security-BCrypt%20Hashing-success?style=for-the-badge)](https://www.php.net/manual/en/function.password-hash.php)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

A clean, modular role-based authentication and user registration architecture developed using **PHP**, **MySQL**, **JavaScript**, and **CSS3**. Engineered as a foundational blueprint for secure session management, credential validation, BCrypt password hashing, and role-based redirection (`admin` vs. `user`).

---

## Architecture & Authentication Flow

```mermaid
flowchart TD
    A["User submits form<br/>(login_register.php)"] --> B{"Action Type"}

    B -- "Register" --> C["Validate Inputs & Check Existing Email"]
    C --> D["Hash Password via password_hash(BCRYPT)"]
    D --> E[("Insert into MySQL<br/>users table")]
    E --> F["Redirect to Login with Success Alert"]

    B -- "Login" --> G["Query User by Email via Prepared Statement"]
    G --> H{"password_verify(pwd, hash)?"}
    H -- "Valid" --> I["Initialize session_start()<br/>Bind user_id, email, role"]
    H -- "Invalid" --> J["Reject with Invalid Credentials Error"]

    I --> K{"Role Decision"}
    K -- "admin" --> L["admin_page.php (Administrator Console)"]
    K -- "user" --> M["user_page.php (User Dashboard)"]
```

---

## Key Features

- **Role-Based Access Control (RBAC):** Distinct dashboards for standard users (`user_page.php`) and administrators (`admin_page.php`), protected by session role gates.
- **BCrypt Password Security:** Implements PHP's native `password_hash()` and `password_verify()` with salted BCrypt cost factors, preventing plaintext storage.
- **Interactive Sliding Form UI:** Responsive CSS/JS form switching smoothly between Login and Register views without separate page loads.
- **Session Lifecycle Management:** Hardened session start, session timeout verification, and complete cookie invalidation upon `logout.php`.

---

## Visual Showcase & Screenshots

<div align="center">
  <table>
    <tr>
      <td width="50%" align="center">
        <img src="screenshots/login.png" alt="Login Screen" width="100%" /><br/>
        <b>Sign In Interface</b>
      </td>
      <td width="50%" align="center">
        <img src="screenshots/register.png" alt="Registration Screen" width="100%" /><br/>
        <b>User Registration Interface</b>
      </td>
    </tr>
    <tr>
      <td width="50%" align="center">
        <img src="screenshots/user.png" alt="User Dashboard" width="100%" /><br/>
        <b>User Dashboard</b>
      </td>
      <td width="50%" align="center">
        <img src="screenshots/admin.png" alt="Admin Dashboard" width="100%" /><br/>
        <b>Admin Management Console</b>
      </td>
    </tr>
  </table>
</div>

---

## Database Topology

The relational schema is defined in [`database.sql`](database.sql):

```sql
CREATE DATABASE IF NOT EXISTS users_db;
USE users_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user'
);
```

---

## Getting Started

### Prerequisites
- PHP 7.4+ or 8.x
- MySQL 5.7+ or 8.0+
- Apache / Nginx (or built-in PHP development server)

### 1. Clone the Repository
```bash
git clone https://github.com/Swaraj0160/php-login-registration-system.git
cd php-login-registration-system
```

### 2. Import Database
Import `database.sql` into your local MySQL server using phpMyAdmin or the MySQL CLI:
```bash
mysql -u root -p < database.sql
```

### 3. Configure Database Connection
Update `config.php` with your local database credentials:
```php
$conn = mysqli_connect('localhost', 'root', 'your_password', 'users_db');
```

### 4. Serve the Application
Using PHP's built-in server:
```bash
php -S localhost:8000
```
Open [http://localhost:8000](http://localhost:8000) in your browser.

---

## Authors & License

- **Developer:** **Swaraj Ingale** ([@Swaraj0160](https://github.com/Swaraj0160))
- **License:** [MIT License](LICENSE)
