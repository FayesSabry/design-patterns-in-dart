// ==============================
// Design Pattern: Observer + Factory Method
// Example: Stock Market Notifications
// ==============================

/// 1️⃣ Observer Interface
abstract class Observer {
  void update(double price);
}

/// 2️⃣ Subject (StockMarket)
class StockMarket {
  final List<Observer> _observers = [];
  double _price = 0;

  // إضافة مشترك
  void register(Observer obs) {
    _observers.add(obs);
  }

  // إزالة مشترك
  void unRegister(Observer obs) {
    _observers.remove(obs);
  }

  // تغيير السعر وإرسال إشعار
  void setNewPrice(double newPrice) {
    _price = newPrice;
    print('📈 Market: new price = $_price');
    notifyObservers();
  }

  // إرسال إشعارات لكل المشتركين
  void notifyObservers() {
    for (var o in _observers) {
      o.update(_price);
    }
  }
}

/// 3️⃣ Concrete Observers
class MobileApp implements Observer {
  @override
  void update(double price) {
    print('📱 MobileApp: Price updated = $price');
  }
}

class WebApp implements Observer {
  @override
  void update(double price) {
    print('💻 WebApp: Price updated = $price');
  }
}

class TVDisplay implements Observer {
  @override
  void update(double price) {
    print("📺 TVDisplay: Price updated = $price");
  }
}

/// 4️⃣ Factory Method
abstract class ObserverFactoryBase {
  Observer createObserver(String type);
}

class ObserverFactory implements ObserverFactoryBase {
  @override
  Observer createObserver(String type) {
    if (type == 'Mobile') {
      return MobileApp();
    } else if (type == 'Web') {
      return WebApp();
    } else if (type == 'TV') {
      return TVDisplay();
    } else {
      throw Exception('❌ Unknown observer type: $type');
    }
  }
}

/// 5️⃣ Main Function (Test the system)
void main() {
  var market = StockMarket();

  // إنشاء Factory
  var factory = ObserverFactory();

  // إنشاء Observers من خلال الـ Factory
  var mobile = factory.createObserver('Mobile');
  var web = factory.createObserver('Web');
  var tv = factory.createObserver('TV');

  // تسجيل Observers في السوق
  market.register(mobile);
  market.register(web);
  market.register(tv);

  // تحديثات الأسعار
  market.setNewPrice(100.0);
  market.setNewPrice(101.5);

  // إزالة Observer
  market.unRegister(web);
  print('❌ WebApp unregistered');

  market.setNewPrice(102.0);
}
