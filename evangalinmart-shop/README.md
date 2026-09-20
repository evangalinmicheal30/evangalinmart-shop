# Evangalinmart — Full Shopping App (Spring Boot)

A complete Java/Spring Boot e-commerce app: user registration & login,
product catalog with search, shopping cart, checkout, order history,
and an admin section for managing products.

## Tech stack
- Java 17, Spring Boot 3.3
- Spring MVC + Thymeleaf (server-rendered HTML front end)
- Spring Security (form login, BCrypt password hashing, role-based access)
- Spring Data JPA + Hibernate + MySQL

## Project structure
```
src/main/java/com/evangalinmart/shop/
├── EvangalinmartApplication.java   # main entry point
├── model/        User, Product, CartItem, Order, OrderItem
├── repository/   UserRepository, ProductRepository, CartItemRepository, OrderRepository
├── service/      CartService, OrderService, CustomUserDetailsService, CurrentUserService
├── controller/   AuthController, ProductController, CartController, OrderController, AdminController
└── config/       SecurityConfig

src/main/resources/
├── templates/    login, register, home, product-details, cart, orders, admin/*
├── static/css/   style.css
├── application.properties
└── data.sql      sample products (loaded on startup)
```

## Setup
1. Create/point to a MySQL server. Edit `src/main/resources/application.properties`:
   ```
   spring.datasource.url=jdbc:mysql://localhost:3306/evangalinmart_db?createDatabaseIfNotExist=true
   spring.datasource.username=root
   spring.datasource.password=YOUR_PASSWORD
   ```
2. Run it:
   ```
   mvn spring-boot:run
   ```
3. Visit `http://localhost:8080/` — you'll see the product catalog (seeded from `data.sql`).

> `data.sql` re-inserts the sample products every time the app starts. Once you've
> added your own products through the admin panel, either delete `data.sql`
> or clear the `products` table's seed rows so they aren't duplicated on restart.

## Accounts & roles
- New sign-ups via `/register` get `ROLE_BUYER` automatically (can browse, buy, view their own orders).
- There is no self-service admin sign-up (by design). To make a user an admin,
  register normally, then run this SQL once against the database:
  ```sql
  UPDATE users SET role = 'ROLE_ADMIN' WHERE email = 'the-admin-email@example.com';
  ```
  That user can then log in and manage products at `/admin/products`.

## Key flows
- **Browse & search** — `/` lists all products; `?keyword=` searches by name.
- **Cart** — `/cart` (add from the catalog or product page, update quantities, remove items).
- **Checkout** — `/cart/checkout` converts the cart into an Order, decrements stock,
  and snapshots each item's name/price so past orders don't change if a product's price changes later.
- **Order history** — `/orders` shows a logged-in user's past orders.
- **Admin** — `/admin/products` (list/add/edit/delete), restricted to `ROLE_ADMIN`.
