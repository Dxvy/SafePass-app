import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:safepass/features/payment/domain/alert_type.dart';
import 'package:safepass/features/payment/domain/payment_lock_service.dart';
import 'package:safepass/features/safety/domain/bracelet_lost_service.dart';

class MockBraceletRepository extends Mock implements BraceletRepository {}

void main() {
  late MockBraceletRepository mockRepo;
  late PaymentLockService lockService;
  late BraceletLostService braceletLostService;

  setUp(() {
    mockRepo = MockBraceletRepository();
    when(() => mockRepo.setPaymentLocked(any())).thenAnswer((_) async {});
    when(() => mockRepo.logEvent(any())).thenAnswer((_) async {});
    lockService = PaymentLockService(braceletRepo: mockRepo);
    braceletLostService = BraceletLostService(paymentLockService: lockService);
  });

  group('BraceletLostService', () {
    test('starts in reported step', () {
      expect(braceletLostService.currentStep, BraceletLostStep.reported);
    });

    test('reportLost freezes the wallet immediately', () async {
      await braceletLostService.reportLost();

      expect(braceletLostService.isWalletFrozen, isTrue);
      expect(braceletLostService.currentStep, BraceletLostStep.walletFrozen);
    });

    test('reportLost triggers braceletLost alert on lock service', () async {
      await braceletLostService.reportLost();

      expect(lockService.currentState.reason, AlertType.braceletLost);
    });

    test('verifyIdentity advances to identityVerified step', () async {
      await braceletLostService.reportLost();
      await braceletLostService.verifyIdentity();

      expect(
        braceletLostService.currentStep,
        BraceletLostStep.identityVerified,
      );
    });

    test('verifyIdentity is a no-op before reportLost', () async {
      await braceletLostService.verifyIdentity();

      expect(braceletLostService.currentStep, BraceletLostStep.reported);
    });

    test('issueReplacement completes the flow and unlocks wallet', () async {
      await braceletLostService.reportLost();
      await braceletLostService.verifyIdentity();
      await braceletLostService.issueReplacement(newBraceletId: 'BR-9999');

      expect(braceletLostService.isComplete, isTrue);
      expect(braceletLostService.isWalletFrozen, isFalse);
    });
  });
}
