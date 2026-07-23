abstract class PaymentRepository {
  Future<double> getBalance();
  Future<bool> processNfcPayment({required double amount, required bool paymentLocked});
  Future<void> topUp({required double amount});
  Future<List<Map<String, dynamic>>> getHistory();
}

class DemoPaymentRepository implements PaymentRepository {
  double _balance = 42.50;
  final List<Map<String, dynamic>> _history = [
    {'label': 'Bière pression', 'amount': -6.0, 'ts': '14:32'},
    {'label': 'Eau minérale', 'amount': -2.5, 'ts': '14:15'},
    {'label': 'Rechargement', 'amount': 50.0, 'ts': '12:00'},
  ];

  @override
  Future<double> getBalance() async => _balance;

  @override
  Future<bool> processNfcPayment({required double amount, required bool paymentLocked}) async {
    if (paymentLocked) return false;
    if (_balance < amount) return false;
    await Future.delayed(const Duration(milliseconds: 400));
    _balance -= amount;
    _history.insert(0, {'label': 'Paiement NFC', 'amount': -amount, 'ts': 'maintenant'});
    return true;
  }

  @override
  Future<void> topUp({required double amount}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _balance += amount;
    _history.insert(0, {'label': 'Rechargement', 'amount': amount, 'ts': 'maintenant'});
  }

  @override
  Future<List<Map<String, dynamic>>> getHistory() async => List.from(_history);
}
