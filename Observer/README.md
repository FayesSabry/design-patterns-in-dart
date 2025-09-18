# Observer + Factory Method in Dart 🎯

هذا المشروع يوضح كيفية استخدام **Design Patterns**:
- **Observer Pattern** 👉 لمتابعة التغييرات (Notifications).
- **Factory Method** 👉 لإنشاء كائنات (Objects) بطريقة مرنة ومنظمة.

---

## 👀 الفكرة
- عندنا **سوق أسهم (Stock Market)** بيغير سعر السهم.
- في Observers (تطبيقات مختلفة: Mobile, Web, TV) مسجلين مع السوق.
- لما السعر يتغير → كل Observers يتبعتلهم إشعار أوتوماتيك.
- لإنشاء Observers مختلفة بشكل مرتب، استخدمنا **Factory Method**.

---

## 📂 هيكل المشروع
```
project/
 ├─ observer_factory_example.dart   # الكود الرئيسي
 └─ README.md                       # ملف التوثيق
```

---

## 🛠️ خطوات التشغيل
1. تأكد إن Dart SDK متثبت.  
2. شغّل الملف:
   ```bash
   dart run observer_factory_example.dart
   ```
3. النتيجة هتظهر في الـ Console.

---

## 📸 مثال من التشغيل
```
📈 Market: new price = 100.0
📱 MobileApp: Price updated = 100.0
💻 WebApp: Price updated = 100.0
📺 TVDisplay: Price updated = 100.0

📈 Market: new price = 101.5
📱 MobileApp: Price updated = 101.5
💻 WebApp: Price updated = 101.5
📺 TVDisplay: Price updated = 101.5

❌ Web App unregistered

📈 Market: new price = 102.0
📱 MobileApp: Price updated = 102.0
📺 TVDisplay: Price updated = 102.0
```

---

## 📌 Use Cases حقيقية

### 1. إشعارات سوق الأسهم
- كل مستخدم (موبايل، ويب، شاشة عرض) يستقبل إشعار بالسعر الجديد.

### 2. Social Media
- لو نزل Post جديد → كل المتابعين يجيلهم إشعار.

### 3. أنظمة الدفع (Payments)
- تحديث في Transaction → إشعار بالموبايل، إيميل، Dashboard.

### 4. الألعاب (Multiplayer Games)
- حركة لاعب → تتوزع على باقي اللاعبين.

---

## 📊 UML Diagram (مبسطة)
```
        +------------------+
        |   StockMarket    |  (Subject)
        +------------------+
        | - observers[]    |
        | - price          |
        +------------------+
        | + register()     |
        | + unRegister()   |
        | + setNewPrice()  |
        | + notify()       |
        +------------------+
                 |
         notifies|
                 v
        +------------------+
        |    Observer      | (Interface)
        +------------------+
        | + update()       |
        +------------------+
         /      |       \
        /       |        \
       v        v         v
+-----------+ +--------+ +---------+
| MobileApp | | WebApp | | TVDisplay |
+-----------+ +--------+ +---------+
| update()  | |update() | |update() |
+-----------+ +--------+ +---------+

        +----------------------+
        |   ObserverFactory    |
        +----------------------+
        | + createObserver()   |
        +----------------------+
```

---

## ✅ الميزة
- الكود منظم وسهل التوسعة.  
- تقدر تضيف Observer جديد (زي EmailApp) من غير ما تغيّر في المنظومة كلها، بس تضيفه في الـ Factory.
