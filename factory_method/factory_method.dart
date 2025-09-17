abstract class Payment {
  void pay(double amount);
}

class Visa implements Payment {
  @override
  void pay(double amount) => print("💳 Paid $amount using Visa");
}

class PayPal implements Payment {
  @override
  void pay(double amount) => print("🌍 Paid $amount using PayPal");
}

class Cash implements Payment {
  @override
  void pay(double amount) => print("💵 Paid $amount using Cash");
}

class PaymentFactory {
  static Payment getPaymentMethod(String type) {
    type = type.toLowerCase();
    if (type == 'visa') return Visa();
    if (type == 'paypal') return PayPal();
    if (type == 'cash') return Cash();
    return Cash(); // Default
  }
}

void main() {
  Payment p1 = PaymentFactory.getPaymentMethod('visa');
  p1.pay(100);

  Payment p2 = PaymentFactory.getPaymentMethod('paypal');
  p2.pay(200);

  Payment p3 = PaymentFactory.getPaymentMethod('cash');
  p3.pay(300);
}
