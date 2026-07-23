import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/payment_repository.dart';
import '../../domain/payment_lock_service.dart';

final paymentRepositoryProvider = Provider<PaymentRepository>(
  (_) => DemoPaymentRepository(),
);

// Shared bracelet repo stub (real impl: Hive + Supabase)
class _StubBraceletRepo implements BraceletRepository {
  @override
  Future<void> setPaymentLocked(bool locked) async {}
  @override
  Future<void> logEvent(String event) async {}
}

final paymentLockServiceProvider = Provider<PaymentLockService>(
  (_) => PaymentLockService(braceletRepo: _StubBraceletRepo()),
);

class PaymentState {
  const PaymentState({
    this.balance = 0,
    this.history = const [],
    this.loading = false,
  });
  final double balance;
  final List<Map<String, dynamic>> history;
  final bool loading;

  PaymentState copyWith({
    double? balance,
    List<Map<String, dynamic>>? history,
    bool? loading,
  }) => PaymentState(
    balance: balance ?? this.balance,
    history: history ?? this.history,
    loading: loading ?? this.loading,
  );
}

class PaymentNotifier extends Notifier<PaymentState> {
  @override
  PaymentState build() {
    _load();
    return const PaymentState(loading: true);
  }

  Future<void> _load() async {
    final repo = ref.read(paymentRepositoryProvider);
    final balance = await repo.getBalance();
    final history = await repo.getHistory();
    state = PaymentState(balance: balance, history: history);
  }

  Future<bool> pay({required double amount}) async {
    final lockService = ref.read(paymentLockServiceProvider);
    final repo = ref.read(paymentRepositoryProvider);
    final ok = await repo.processNfcPayment(
      amount: amount,
      paymentLocked: lockService.currentState.isLocked,
    );
    if (ok) await _load();
    return ok;
  }

  Future<void> topUp({required double amount}) async {
    final repo = ref.read(paymentRepositoryProvider);
    await repo.topUp(amount: amount);
    await _load();
  }
}

final paymentProvider = NotifierProvider<PaymentNotifier, PaymentState>(
  PaymentNotifier.new,
);
