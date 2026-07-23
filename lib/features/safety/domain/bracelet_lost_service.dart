import '../../payment/domain/alert_type.dart';
import '../../payment/domain/payment_lock_service.dart';

enum BraceletLostStep { reported, walletFrozen, identityVerified, replaced }

class BraceletLostService {
  BraceletLostService({required this.paymentLockService});

  final PaymentLockService paymentLockService;

  BraceletLostStep _step = BraceletLostStep.reported;
  BraceletLostStep get currentStep => _step;

  Future<void> reportLost() async {
    _step = BraceletLostStep.reported;
    await paymentLockService.onSensorAlert(AlertType.braceletLost);
    _step = BraceletLostStep.walletFrozen;
  }

  Future<void> verifyIdentity() async {
    if (_step != BraceletLostStep.walletFrozen) return;
    _step = BraceletLostStep.identityVerified;
  }

  Future<void> issueReplacement({required String newBraceletId}) async {
    if (_step != BraceletLostStep.identityVerified) return;
    // In real impl: transfer balance to new bracelet via Supabase Edge Function
    await paymentLockService.staffUnlock();
    _step = BraceletLostStep.replaced;
  }

  bool get isComplete => _step == BraceletLostStep.replaced;
  bool get isWalletFrozen => paymentLockService.currentState.isLocked;
}
