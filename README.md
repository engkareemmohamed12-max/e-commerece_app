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

<img width="300"  alt="Screenshot_20260705_000238_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/ccaad2c7-bd65-49ec-bb2b-232441ad5993" />
<img width="300"  alt="Screenshot_20260705_000247_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/d743ef6a-5add-4543-9ccb-25c4e641d3a2" />



### Home Screen

<img width="300"  alt="Screenshot_20260705_000321_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/3890b582-a764-44e7-99ec-9f34c6c9d3e2" />


### Categories Screen

<img width="1264" height="2736" alt="Screenshot_20260705_000337_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/e771b71e-3e59-4321-884c-9f8960ffdbd8" />

### Product Details Screen

<img width="1264" height="2736" alt="Screenshot_20260705_000458_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/4587eb31-87d5-469d-882e-6306b3fc83e0" />

### Cart Screen

<img width="300" alt="Cart Screen" src="YOUR_CART_IMAGE" />

### Profile Screen

<img width="1264" height="2736" alt="Screenshot_20260705_000409_com_example_e_commerece_app_MainActivity" src="https://github.com/user-attachments/assets/077abc3d-7feb-437e-b9b4-a3e1b81080ca" />

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
