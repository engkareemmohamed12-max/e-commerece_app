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
- 👤 User Profile
- 🌐 REST API Integration
- ⚡ Loading & Error Handling
- 📱 Responsive UI
- 🎨 Clean & Modern UI
- 🚀 Smooth Navigation

---

## 📸 Screenshots

### Authentication

<img width="300"  alt="Screenshot_20260705_000238_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/ccaad2c7-bd65-49ec-bb2b-232441ad5993" />
<img width="300"  alt="Screenshot_20260705_000247_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/d743ef6a-5add-4543-9ccb-25c4e641d3a2" />



### Home Screen

<img width="300"  alt="Screenshot_20260705_000321_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/3890b582-a764-44e7-99ec-9f34c6c9d3e2" />


### Categories Screen

<img width="300"  alt="Screenshot_20260705_000337_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/a5a10589-4b93-42f5-908d-bb417a5001f8" />

### Product Details Screen

<img width="300"  alt="Screenshot_20260705_000458_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/75823348-5b4f-43c6-a50e-721843f21d4e" />

### Cart Screen

<img width="300"  alt="Screenshot (1)" src="https://github.com/user-attachments/assets/4498e7e0-ed8f-4480-a4b6-2d91817e2c78" />

### Profile Screen

<img width="300"  alt="Screenshot_20260705_000409_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/433fcbeb-6f7f-4cdf-aa30-116f25eb3863" />

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
