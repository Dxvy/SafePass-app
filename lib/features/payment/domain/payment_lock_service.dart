import 'alert_type.dart';
import 'payment_lock_state.dart';

abstract class BraceletRepository {
  Future<void> setPaymentLocked(bool locked);
  Future<void> logEvent(String event);
}

class PaymentLockService {
  PaymentLockService({required BraceletRepository braceletRepo})
      : _repo = braceletRepo;

  final BraceletRepository _repo;
  PaymentLockState currentState = const PaymentLockState.unlocked();

  Future<void> onSensorAlert(AlertType alertType) async {
    currentState = PaymentLockState.locked(reason: alertType);
    await _repo.setPaymentLocked(true);
  }

  Future<void> confirmUserIsOk() async {
    if (!currentState.isLocked) return;
    // SOS manual requires explicit staff confirmation — only auto-alerts can self-clear
    if (currentState.reason == AlertType.sosManual) return;
    currentState = const PaymentLockState.unlocked();
    await _repo.setPaymentLocked(false);
    await _repo.logEvent('no_pulse_cancelled_by_user');
  }

  Future<void> staffUnlock() async {
    currentState = const PaymentLockState.unlocked();
    await _repo.setPaymentLocked(false);
    await _repo.logEvent('payment_unlocked_by_staff');
  }
}
