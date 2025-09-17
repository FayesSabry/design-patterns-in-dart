# Singleton Pattern 🔒

## 📖 Idea
Ensure a class has **only one instance** and provide a global access point to it.

---

## 📝 Example in Dart
```dart
class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal();
}

void main() {
  var obj1 = Singleton();
  var obj2 = Singleton();

  print(obj1 == obj2); // true ✅
}

```

---

## ▶️ Output
```
true
```
