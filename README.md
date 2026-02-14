# 🛒 Smart Z eCommerce — Flutter BLoC App

Aplicación móvil de e-commerce desarrollada en Flutter utilizando arquitectura por features y manejo de estado con BLoC/Cubit.

Este proyecto simula una tienda online completa: listado de productos, detalle, carrito de compras y checkout simulado.

---

## 📱 Características principales

✅ Consumo de API REST real  
✅ Arquitectura por features  
✅ Manejo de estado con BLoC y Cubit  
✅ Lista de productos  
✅ Detalle de producto  
✅ Carrito de compras con cantidades  
✅ Badge dinámico en el ícono del carrito  
✅ Eliminación por swipe y botón  
✅ Checkout simulado (dirección + pago)  
✅ Resumen de compra  
✅ UI Material 3  

---

## 🧠 Arquitectura

El proyecto sigue una arquitectura inspirada en Clean Architecture organizada por features:

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

## ⚙️ Manejo de estado

Se utilizan:

- **BLoC** → Para productos (ProductBloc)
- **Cubit** → Para carrito (CartCubit)

Esto permite:

✔ Separación de responsabilidades  
✔ Escalabilidad  
✔ Testabilidad  
✔ Código mantenible  

---

## 🌐 API utilizada

La aplicación consume una API pública de productos para simular un e-commerce real.

---

## 🛍️ Funcionalidades del carrito

- Agregar productos
- Incrementar cantidad
- Disminuir cantidad
- Eliminar producto
- Vaciar carrito al finalizar compra
- Cálculo automático de total
- Badge con cantidad total de items

---

## 💳 Checkout simulado

El flujo de compra incluye:

- Dirección de envío
- Selección de método de pago
- Resumen del pedido
- Simulación de procesamiento
- Confirmación de compra

---

## 🚀 Cómo ejecutar el proyecto

### Requisitos

- Flutter SDK instalado
- Emulador o dispositivo físico

### Pasos

```bash
git clone https://github.com/Zetien/ecomerce_bloc_flutter.git
cd ecomerce_bloc_flutter
flutter pub get
flutter run
```
---

## 🧩 Tecnologías utilizadas

- Flutter
- Dart
- flutter_bloc
- Dio (HTTP client)
- Material 3

---

## 🎯 Objetivo del proyecto

Este proyecto fue desarrollado como parte de un portafolio profesional para demostrar habilidades en:

- Desarrollo de aplicaciones móviles con Flutter
- Arquitectura limpia
- Manejo de estado avanzado
- Consumo de APIs REST
- Diseño de interfaces modernas
- Flujo completo de e-commerce

---

## 👨‍💻 Autor

Jorge Zetien

Ingeniero de Sistemas — Desarrollador Flutter

---

## 📄 Licencia

Proyecto de uso educativo y demostrativo.


---



