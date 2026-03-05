# 🛒 Smart Z eCommerce — Flutter BLoC App

Mobile e-commerce application developed in Flutter using a feature-based architecture and state management with BLoC/Cubit.

This project simulates a complete online store: product listing, product detail, shopping cart, and a simulated checkout.

---

## 📱 Main Features

✅ Real REST API consumption
✅ Feature-based architecture
✅ State management with BLoC and Cubit
✅ Product list
✅ Product detail
✅ Shopping cart with quantities
✅ Dynamic badge on cart icon
✅ Swipe-to-delete and button removal
✅ Simulated checkout (address + payment)
✅ Order summary
✅ Material 3 UI 

---

## 🧠 Architecture

The project follows a Clean Architecture–inspired structure organized by features:

- lib/
- ├── features/
- │ ├── products/
- │ │ ├── data/
- │ │ ├── domain/
- │ │ └── presentation/
- │ └── cart/
- │ ├── domain/
- │ └── presentation/
- ├── core/
- └── main.dart


---

## ⚙️ State Management

The project uses:

- **BLoC** → For products (ProductBloc)
- **Cubit** → For the cart (CartCubit)

This enables:

✔ Separation of responsibilities
✔ Scalability
✔ Testability
✔ Maintainable code  

---

## 🌐 API Used

The application consumes (Fake Store API) a public products API to simulate a real e-commerce environment.

---

## 🛍️ Cart Features

- Add products
- Increase quantity
- Decrease quantity
- Remove product
- Clear cart after purchase
- Automatic total calculation
- Badge showing total item count

---

## 💳 Simulated Checkout

The purchase flow includes:

- Shipping address
- Payment method selection
- Order summary
- Processing simulation
- Purchase confirmation

---

## 🚀 How to Run the Project

### Requirements

- Flutter SDK installed
- Emulator or physical device

### Steps

```bash
git clone https://github.com/Zetien/ecomerce_bloc_flutter.git
cd ecomerce_bloc_flutter
flutter pub get
flutter run
```
---

## 🧩 Technologies Used

- Flutter
- Dart
- flutter_bloc
- Dio (HTTP client)
- Material 3

---

## 🎯 Project Goal

This project was developed as part of a professional portfolio to demonstrate skills in:

- Mobile app development with Flutter
- Clean architecture
- Advanced state management
- REST API consumption
- Modern UI design

---

## 👨‍💻 Author

Jorge Zetien

Systems Engineer — Flutter Developer

---

## 📄 License

Educational and demonstration purposes only.


---



