import 'alert_type.dart';

class PaymentLockState {
  const PaymentLockState._({required this.isLocked, this.reason});

  final bool isLocked;
  final AlertType? reason;

  const PaymentLockState.unlocked() : this._(isLocked: false);
  const PaymentLockState.locked({required AlertType reason})
      : this._(isLocked: true, reason: reason);

  @override
  String toString() => 'PaymentLockState(isLocked: $isLocked, reason: $reason)';
}
