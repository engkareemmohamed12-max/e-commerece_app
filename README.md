# 🛒 ShopEase — Flutter E-Commerce Application

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-success)
![Cubit](https://img.shields.io/badge/State%20Management-Cubit-blue)
![REST API](https://img.shields.io/badge/API-REST-orange)

A modern Flutter E-Commerce application built with **Clean Architecture**, **Cubit (BLoC)**, and **REST APIs**, delivering a scalable, maintainable, and responsive shopping experience.

The project demonstrates best practices in Flutter development using feature-based architecture, repository pattern, dependency injection, reusable widgets, and clean code principles.

---

## 📱 Features

- 🔐 User Authentication (Login & Register)
- 🏠 Home Screen
- 🛍 Browse Products
- 📂 Browse Categories
- 🏷 Browse Brands
- 📄 Product Details
- 🛒 Shopping Cart
- ➕ Add Products to Cart
- ✏️ Update Cart Quantity
- ❌ Remove Products from Cart
- 👤 User Profile
- 🌐 REST API Integration
- ⚡ Loading & Error Handling
- 📱 Responsive UI
- 🎨 Clean & Modern UI
- 🚀 Smooth Navigation

---

## 📸 Screenshots

### Authentication

<img width="300" alt="Login Screen" src="YOUR_LOGIN_IMAGE" />
<img width="300" alt="Register Screen" src="YOUR_REGISTER_IMAGE" />

### Home Screen

<img width="300" alt="Home Screen" src="YOUR_HOME_IMAGE" />

### Categories Screen

<img width="300" alt="Categories Screen" src="YOUR_CATEGORIES_IMAGE" />

### Product Details Screen

<img width="300" alt="Product Details" src="YOUR_PRODUCT_DETAILS_IMAGE" />

### Cart Screen

<img width="300" alt="Cart Screen" src="YOUR_CART_IMAGE" />

### Profile Screen

<img width="300" alt="Profile Screen" src="YOUR_PROFILE_IMAGE" />

---

## 🎥 Demo

Watch a quick walkthrough of the application.

YOUR_VIDEO_LINK

---

## 🏗️ Project Structure

```text
lib/
│
├── api/
│
├── core/
│   ├── cache/
│   ├── di/
│   ├── exception/
│   ├── utils/
│   └── widget/
│
├── data/
│
├── domain/
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── category/
│   ├── brand/
│   ├── product_details/
│   ├── cart/
│   └── profile/
│
├── main.dart
```

---

## 🧠 Architecture

The application follows **Clean Architecture** principles.

```text
Presentation Layer
        │
        ▼
Cubit (State Management)
        │
        ▼
Domain Layer
│
├── Entities
├── Repository Contracts
└── Use Cases
        │
        ▼
Data Layer
│
├── Repository Implementations
├── Remote Data Sources
└── Models
        │
        ▼
REST API
```

### Architecture Benefits

- Clean Architecture
- Feature-Based Structure
- SOLID Principles
- Repository Pattern
- Use Case Pattern
- Dependency Injection
- Separation of Concerns
- Scalable & Maintainable Code
- Reusable Components
- Easy Testing

---

## 🛠️ Tech Stack

- Flutter
- Dart
- Cubit (flutter_bloc)
- Clean Architecture
- Dio
- REST API
- GetIt
- Injectable
- Shared Preferences

---

## 📦 Packages

| Package | Purpose |
|----------|----------|
| flutter_bloc | State Management |
| dio | Networking |
| get_it | Dependency Injection |
| injectable | Dependency Injection |
| pretty_dio_logger | API Logging |
| shared_preferences | Local Storage |
| cached_network_image | Image Caching |
| flutter_screenutil | Responsive UI |

---

## 🌐 API

The application communicates with a RESTful API to manage:

- User Authentication
- Products
- Categories
- Brands
- Shopping Cart
- User Profile

---

## 🚀 Getting Started

### Clone Repository

```bash
git clone https://github.com/engkareemmohamed12-max/ShopEase.git
```

### Install Dependencies

```bash
flutter pub get
```

### Run the Application

```bash
flutter run
```

---

## 💼 Skills Demonstrated

- Clean Architecture
- Cubit State Management
- REST API Integration
- Repository Pattern
- Dependency Injection
- Use Case Pattern
- Responsive UI Development
- Authentication Flow
- Shopping Cart Management
- Error Handling
- API Consumption using Dio
- Shared Preferences
- Reusable Widgets
- SOLID Principles
- Scalable Flutter Development

---

## 👨‍💻 Developer

**Karim Mohamed**

Flutter Developer

### Connect with Me

- LinkedIn: https://www.linkedin.com/in/kareem-mohamed-flutter/
- GitHub: https://github.com/engkareemmohamed12-max
