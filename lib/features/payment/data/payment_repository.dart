abstract class PaymentRepository {
  Future<double> getBalance();
  Future<bool> processNfcPayment({
    required double amount,
    required bool paymentLocked,
  });
  Future<void> topUp({required double amount});
  Future<List<Map<String, dynamic>>> getHistory();
}

class DemoPaymentRepository implements PaymentRepository {
  double _balance = 142.50;
  final List<Map<String, dynamic>> _history = [
    {'label': 'Main Stage Bar', 'amount': -12.0, 'ts': 'Today, 8:42 PM'},
    {'label': 'Neon Tacos', 'amount': -15.50, 'ts': 'Today, 6:15 PM'},
    {'label': 'Balance Top-up', 'amount': 100.0, 'ts': 'Yesterday, 11:00 AM'},
    {'label': 'Forest Bar', 'amount': -8.0, 'ts': 'Yesterday, 9:30 PM'},
    {'label': 'Water Station', 'amount': -2.0, 'ts': 'Yesterday, 7:00 PM'},
  ];

  @override
  Future<double> getBalance() async => _balance;

  @override
  Future<bool> processNfcPayment({
    required double amount,
    required bool paymentLocked,
  }) async {
    if (paymentLocked) return false;
    if (_balance < amount) return false;
    await Future.delayed(const Duration(milliseconds: 400));
    _balance -= amount;
    _history.insert(0, {
      'label': 'NFC Payment',
      'amount': -amount,
      'ts': 'Just now',
    });
    return true;
  }

  @override
  Future<void> topUp({required double amount}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _balance += amount;
    _history.insert(0, {
      'label': 'Balance Top-up',
      'amount': amount,
      'ts': 'Just now',
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getHistory() async => List.from(_history);
}
