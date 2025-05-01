# 🍔 Flutter Food Ordering App

A fully functional Ui food ordering application built using Flutter with **MVVM architecture** and **Provider** for state management. This app replicates a professional UI from a Figma design and includes all core features of a food delivery platform.

---

## 🚀 Features

- **MVVM Architecture** for clear separation of concerns
- **Provider** for reactive state management
- **Restaurant Header**: full-width image, back/search/share buttons
- **Restaurant Info**: name, cuisine, rating, reviews, delivery time
- **Search Screen**: live filtering, suggestion chips, voice input icon
- **Category Tabs**: horizontally scrollable (Recommended, Combos, etc.)
- **Product List**: asset-backed images, name, description, price
- **Quantity Controls**: add/remove buttons with current count
- **Persistent Cart Summary**: bottom bar showing total items & price

---

## 📦 Folder Structure

lib/ 
    ├── main.dart
    ├── models/ 
    │ └── product.dart 
    ├── viewmodels/ 
    │ ├── product_viewmodel.dart 
    │ └── cart_viewmodel.dart 
    ├── views/
    │ ├── home_view.dart   
    │ ├── search_view.dart
    │ └── cart_view.dart 
    └── widgets/ 
    ├── app_search_bar.dart
    ├── category_list.dart
    ├── product_item.dart 
    └── cart_summary.dart

---

## 📁 Assets

```yaml
flutter:
  assets:
    - assets/images/
```
---

## 🧾 Custom Fonts
flutter:
  fonts:
     - family: Poppins
       fonts:
         - asset: assets/fonts/Poppins-Regular.ttf
         - asset: assets/fonts/Poppins-Bold.ttf
           weight: 700

---

## 📄 License
    - This project is for educational/interview purposes.
    - Feel free to fork and reuse with proper attribution.
   
