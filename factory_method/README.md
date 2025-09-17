# 🏭 Factory Method Pattern Example (Payments)

This project demonstrates the **Factory Method Design Pattern** in Dart using a simple **Payment System** example.

---

## 📌 What is Factory Method Pattern?
The **Factory Method Pattern** is a creational design pattern that provides an interface for creating objects, but allows subclasses (or factory logic) to decide which class to instantiate.  

✅ Benefits:
- Centralizes object creation logic.
- Easy to extend (add new types without changing existing code).
- Avoids repetitive `new` statements in multiple places.

---

## 🎯 Problem
Without Factory:
- We would write `new Visa()`, `new PayPal()` everywhere.
- Hard to maintain if new payment methods are added.
- Classes become tightly coupled.

With Factory:
- Object creation logic is placed in **PaymentFactory**.
- The client code only requests a type by name.

---

## 🛠️ Implementation

### 1. Abstract Class
```dart
abstract class Payment {
  void pay(double amount);
}
