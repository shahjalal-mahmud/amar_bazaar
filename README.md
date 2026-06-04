<div align="center">

# 🛒 Product Showcase

**A simple Flutter product listing application**

*Built for the bdapps National Android Development Bootcamp 2026*
*Flutter Assignment — Dynamic Product List UI*

---

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge\&logo=flutter\&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge\&logo=dart\&logoColor=white)
![Material 3](https://img.shields.io/badge/Material_3-Design-6C3EF4?style=for-the-badge\&logo=materialdesign\&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-green?style=for-the-badge)

</div>

---

# 📌 About the Project

**Product Showcase** is a simple Flutter application created as part of the **bdapps National Android Development Bootcamp 2026**.

The application demonstrates how to display a dynamic list of products using Flutter widgets and Dart collections. Product information is stored locally inside a Dart `List` and rendered dynamically using Flutter's list-building capabilities.

Each product card displays:

* Product image (loaded from a network URL)
* Product name
* Product price

The project focuses on fundamental Flutter concepts including UI building, lists, widgets, and dynamic data rendering.

---

# ✨ Features

* 📦 Dynamic product list
* 🌐 Product images loaded from network URLs
* 💰 Product name and price display
* 📱 Responsive Material Design UI
* ⚡ Lightweight and beginner-friendly implementation
* 🎯 Uses Dart collections for local data storage

---

# 🗂️ Project Structure

```text
product_showcase/
│
├── lib/
│   └── main.dart
├── pubspec.yaml
└── README.md
```

---

# 🗃️ Product Data Structure

The application stores product information inside a Dart `List<Map<String, dynamic>>`.

```dart
final List<Map<String, dynamic>> products = [
  {
    "name": "iPhone 15 Pro",
    "price": 149999,
    "image":
        "https://images.unsplash.com/photo-example-1",
  },
  {
    "name": "Samsung Galaxy S24",
    "price": 119999,
    "image":
        "https://images.unsplash.com/photo-example-2",
  },
];
```

The UI is generated dynamically by iterating through this list and creating product cards for each item.

---

# 🎨 UI Highlights

* Material 3 design language
* Modern card-based layout
* Rounded product cards
* Clean spacing and typography
* Network image loading
* Scrollable product list

---

# 🚀 Getting Started

## Prerequisites

* Flutter SDK 3.0+
* Dart SDK 3.0+
* Android Studio / VS Code
* Android Emulator or Physical Device

---

## Run the Project

```bash
# Navigate into the project
cd product_showcase

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## Build Release APK

```bash
flutter build apk --release
```

---

# 🧠 Technologies Used

| Technology       | Purpose                   |
|------------------|---------------------------|
| Flutter          | UI Framework              |
| Dart             | Programming Language      |
| Material 3       | UI Design System          |
| List             | Data Storage              |
| ListView.builder | Dynamic UI Rendering      |
| NetworkImage     | Load Images from Internet |

---

# 🎯 Assignment Details

| Field        | Information                                       |
|--------------|---------------------------------------------------|
| Program      | bdapps National Android Development Bootcamp 2026 |
| Assignment   | Flutter Product Listing App                       |
| Topic        | Dynamic List Rendering                            |
| Data Source  | Local Dart List                                   |
| Image Source | Network URLs                                      |
| UI Type      | Single Screen Application                         |

---

# 👨‍💻 Developer

<div align="center">

### Md Shahajalal Mahmud

**Android Developer • Flutter Learner**

*Learning, Building, Growing 🚀*

</div>

---

# 💙 Acknowledgements

Special thanks to the mentors and organizers of the **National Android Development Bootcamp (NADB) 2026** for providing structured learning opportunities and hands-on assignments for aspiring developers.

---

<div align="center">

📜 **Educational Project • NADB 2026**

</div>
