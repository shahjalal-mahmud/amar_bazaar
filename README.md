<div align="center">

# 🛍️ Product Catalog

### Modern Flutter Product Listing App

*A clean and responsive product showcase application powered by REST API integration.*

**bdapps National Android Development Bootcamp 2026 — Flutter Assignment**

---

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge\&logo=flutter\&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge\&logo=dart\&logoColor=white)
![API](https://img.shields.io/badge/REST-API-FF6F00?style=for-the-badge)
![Material 3](https://img.shields.io/badge/Material_3-Design-6C3EF4?style=for-the-badge\&logo=materialdesign\&logoColor=white)
![Educational](https://img.shields.io/badge/Project-Educational-success?style=for-the-badge)

</div>

---

# 📖 Overview

**Product Catalog** is a Flutter application developed as part of the **bdapps National Android Development Bootcamp 2026**.

The application fetches product information from a remote REST API and displays it in a visually appealing, scrollable product catalog. It demonstrates how Flutter can be used to consume APIs, manage asynchronous data, and build modern responsive user interfaces.

The app focuses on real-world Flutter development practices including:

* API Integration
* JSON Parsing
* Network Image Loading
* Dynamic UI Rendering
* Loading & Error Handling
* Responsive Material 3 Design

---

# ✨ Features

### 📦 Product Listing

Display products dynamically fetched from a REST API.

### 🌐 API Integration

Retrieve product information from an online endpoint using HTTP requests.

### 🖼️ Product Images

Load and cache product images directly from network URLs.

### 💰 Price Display

Show formatted product pricing information.

### 📱 Responsive UI

Optimized for different screen sizes and orientations.

### ⏳ Loading State

User-friendly loading indicators while fetching data.

### ⚠️ Error Handling

Gracefully handles network failures and API errors.

### 🎨 Modern Design

Built using Material 3 design principles with polished card layouts and clean typography.

---

# 📸 UI Highlights

* Material 3 Design System
* Modern Product Cards
* Rounded Corners & Elevation
* Responsive Layout
* Network Image Support
* Smooth Scrolling Experience
* Clean Typography
* Professional Color Palette
* Loading & Error States

---

# 🏗️ Project Structure

```text
product_catalog/
│
├── lib/
│   ├── models/
│   │   └── product.dart
│   │
│   ├── services/
│   │   └── api_service.dart
│   │
│   ├── screens/
│   │   └── home_screen.dart
│   │
│   ├── widgets/
│   │   └── product_card.dart
│   │
│   └── main.dart
│
├── pubspec.yaml
└── README.md
```

---

# 🔗 API Integration

Products are retrieved from a REST API endpoint and converted into Dart model objects.

Example Product Response:

```json
{
  "id": 1,
  "title": "iPhone 15 Pro",
  "price": 149999,
  "image": "https://example.com/product.jpg"
}
```

The application fetches data asynchronously and updates the UI automatically after receiving the response.

---

# 🧩 Core Flutter Concepts Demonstrated

* Stateless Widgets
* Stateful Widgets
* FutureBuilder
* HTTP Requests
* JSON Serialization
* ListView.builder
* Network Images
* Material 3 Components
* Responsive Layout Design

---

# 🚀 Getting Started

## Prerequisites

* Flutter SDK 3.0+
* Dart SDK 3.0+
* Android Studio / VS Code
* Android Emulator or Physical Device

---

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/product_catalog.git
```

Navigate to the project directory:

```bash
cd product_catalog
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

# 📦 Build Release APK

```bash
flutter build apk --release
```

---

# 🛠️ Technologies Used

| Technology       | Purpose                     |
|------------------|-----------------------------|
| Flutter          | Cross-platform UI Framework |
| Dart             | Programming Language        |
| REST API         | Product Data Source         |
| HTTP Package     | API Communication           |
| JSON             | Data Exchange Format        |
| Material 3       | Modern UI Design            |
| ListView.builder | Dynamic Rendering           |
| NetworkImage     | Image Loading               |

---

# 🎯 Assignment Information

| Field           | Details                                           |
|-----------------|---------------------------------------------------|
| Program         | bdapps National Android Development Bootcamp 2026 |
| Assignment Type | Flutter Development                               |
| Topic           | Product Listing Application                       |
| Data Source     | REST API                                          |
| Architecture    | Simple Layered Structure                          |
| UI Type         | Single Screen                                     |
| Design System   | Material 3                                        |

---

# 🎓 Learning Outcomes

Through this project, the following Flutter concepts are demonstrated:

* Consuming REST APIs
* Working with asynchronous operations
* Parsing JSON data
* Building reusable widgets
* Displaying dynamic content
* Creating responsive UIs
* Managing loading and error states

---

# 👨‍💻 Developer

<div align="center">

## Md Shahajalal Mahmud

**Android Developer • Flutter Learner**

Passionate about building modern mobile applications using Flutter, Kotlin, Jetpack Compose, and Firebase.

🚀 Learning • Building • Improving

</div>

---

# 🙏 Acknowledgements

Special thanks to the mentors and organizers of the **bdapps National Android Development Bootcamp 2026** for providing practical learning opportunities and hands-on development assignments.

---

<div align="center">

### 📚 Educational Project

**National Android Development Bootcamp 2026**

Made with ❤️ using Flutter

</div>
