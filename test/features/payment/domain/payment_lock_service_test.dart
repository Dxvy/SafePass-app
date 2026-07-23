import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:safepass/features/payment/domain/alert_type.dart';
import 'package:safepass/features/payment/domain/payment_lock_service.dart';
import 'package:safepass/features/payment/domain/payment_lock_state.dart';

class MockBraceletRepository extends Mock implements BraceletRepository {}

void main() {
  late MockBraceletRepository mockRepo;
  late PaymentLockService service;

  setUp(() {
    mockRepo = MockBraceletRepository();
    when(() => mockRepo.setPaymentLocked(any())).thenAnswer((_) async {});
    when(() => mockRepo.logEvent(any())).thenAnswer((_) async {});
    service = PaymentLockService(braceletRepo: mockRepo);
  });

  group('PaymentLockService — initial state', () {
    test('starts unlocked', () {
      expect(service.currentState.isLocked, isFalse);
      expect(service.currentState.reason, isNull);
    });
  });

  group('PaymentLockService — onSensorAlert', () {
    test('locks NFC payments when a no-pulse alert is raised', () async {
      await service.onSensorAlert(AlertType.noPulse);

      verify(() => mockRepo.setPaymentLocked(true)).called(1);
      expect(service.currentState.isLocked, isTrue);
      expect(service.currentState.reason, AlertType.noPulse);
    });

    test('locks on braceletLost alert', () async {
      await service.onSensorAlert(AlertType.braceletLost);

      expect(service.currentState.isLocked, isTrue);
      expect(service.currentState.reason, AlertType.braceletLost);
    });

    test('locks on sosManual alert', () async {
      await service.onSensorAlert(AlertType.sosManual);

      expect(service.currentState.isLocked, isTrue);
      expect(service.currentState.reason, AlertType.sosManual);
    });

    test('double alert keeps locked (idempotent)', () async {
      await service.onSensorAlert(AlertType.noPulse);
      await service.onSensorAlert(AlertType.noPulse);

      expect(service.currentState.isLocked, isTrue);
      verify(() => mockRepo.setPaymentLocked(true)).called(2);
    });

    test('second alert overwrites reason', () async {
      await service.onSensorAlert(AlertType.noPulse);
      await service.onSensorAlert(AlertType.braceletLost);

      expect(service.currentState.reason, AlertType.braceletLost);
    });
  });

  group("PaymentLockService — confirmUserIsOk", () {
    test("'I'm OK' re-enables payments and logs the event", () async {
      service.currentState = const PaymentLockState.locked(
        reason: AlertType.noPulse,
      );

      await service.confirmUserIsOk();

      expect(service.currentState.isLocked, isFalse);
      verify(() => mockRepo.logEvent('no_pulse_cancelled_by_user')).called(1);
      verify(() => mockRepo.setPaymentLocked(false)).called(1);
    });

    test('does NOT unlock when reason is sosManual (requires staff)', () async {
      service.currentState = const PaymentLockState.locked(
        reason: AlertType.sosManual,
      );

      await service.confirmUserIsOk();

      expect(service.currentState.isLocked, isTrue);
      verifyNever(() => mockRepo.setPaymentLocked(false));
    });

    test('confirmUserIsOk on already-unlocked state is a no-op', () async {
      await service.confirmUserIsOk();

      expect(service.currentState.isLocked, isFalse);
      verifyNever(() => mockRepo.setPaymentLocked(false));
    });
  });

  group('PaymentLockService — staffUnlock', () {
    test('staff can unlock SOS manual alerts', () async {
      service.currentState = const PaymentLockState.locked(
        reason: AlertType.sosManual,
      );

      await service.staffUnlock();

      expect(service.currentState.isLocked, isFalse);
      verify(() => mockRepo.logEvent('payment_unlocked_by_staff')).called(1);
    });

    test('staffUnlock logs a distinct event from user self-clear', () async {
      service.currentState = const PaymentLockState.locked(
        reason: AlertType.noPulse,
      );

      await service.staffUnlock();

      verify(() => mockRepo.logEvent('payment_unlocked_by_staff')).called(1);
      verifyNever(() => mockRepo.logEvent('no_pulse_cancelled_by_user'));
    });
  });

  group('PaymentLockService — full flow', () {
    test('lock → user OK → unlocked → re-lock cycle works', () async {
      await service.onSensorAlert(AlertType.noPulse);
      expect(service.currentState.isLocked, isTrue);

      await service.confirmUserIsOk();
      expect(service.currentState.isLocked, isFalse);

      await service.onSensorAlert(AlertType.braceletLost);
      expect(service.currentState.isLocked, isTrue);
    });
  });
}
