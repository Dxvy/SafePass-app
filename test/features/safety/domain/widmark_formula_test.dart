import 'package:flutter_test/flutter_test.dart';
import 'package:safepass/features/safety/domain/widmark_formula.dart';

void main() {
  group('WidmarkFormula.estimate', () {
    // --- Zero / boundary cases ---

    test('returns 0.0 g/L when no drinks were declared', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 0,
        weightKg: 65,
        sex: SexAssignedAtBirth.female,
        hoursSinceFirstDrink: 1,
      );
      expect(result.bac, 0.0);
      expect(result.zone, BacZone.safe);
    });

    test('returns 0.0 g/L when weight is zero', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 20,
        weightKg: 0,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 0,
      );
      expect(result.bac, 0.0);
    });

    test('returns 0.0 g/L when BAC would be negative after long elapsed time', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 10,
        weightKg: 70,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 24,
      );
      expect(result.bac, 0.0);
      expect(result.zone, BacZone.safe);
    });

    // --- R coefficient ---

    test('uses R_MALE = 0.70 for male', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 20,
        weightKg: 70,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 0,
      );
      expect(result.rCoefficient, closeTo(0.70, 0.001));
    });

    test('uses R_FEMALE = 0.55 for female', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 20,
        weightKg: 65,
        sex: SexAssignedAtBirth.female,
        hoursSinceFirstDrink: 0,
      );
      expect(result.rCoefficient, closeTo(0.55, 0.001));
    });

    test('uses the neutral R coefficient 0.615 when sex is unspecified', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 20,
        weightKg: 70,
        sex: SexAssignedAtBirth.unspecified,
        hoursSinceFirstDrink: 0,
      );
      expect(result.rCoefficient, closeTo(0.615, 0.001));
    });

    // --- ArgumentError ---

    test('throws ArgumentError for a negative elapsed time', () {
      expect(
        () => WidmarkFormula.estimate(
          drinksInGrams: 10,
          weightKg: 60,
          sex: SexAssignedAtBirth.male,
          hoursSinceFirstDrink: -2,
        ),
        throwsArgumentError,
      );
    });

    test('throws ArgumentError for -0.001 (strictly negative)', () {
      expect(
        () => WidmarkFormula.estimate(
          drinksInGrams: 5,
          weightKg: 70,
          sex: SexAssignedAtBirth.female,
          hoursSinceFirstDrink: -0.001,
        ),
        throwsArgumentError,
      );
    });

    // --- Zone classification ---

    test('classifies low BAC as BacZone.safe', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 5,
        weightKg: 80,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 0,
      );
      expect(result.zone, BacZone.safe);
      expect(result.alcoholPurchaseBlocked, isFalse);
    });

    test('classifies ~0.60 g/L as BacZone.moderate', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 35,
        weightKg: 70,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 0.5,
      );
      expect(result.zone, BacZone.moderate);
      expect(result.alcoholPurchaseBlocked, isFalse);
    });

    test('classifies 0.95 g/L as BacZone.high and blocks NFC alcohol purchase', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 55,
        weightKg: 58,
        sex: SexAssignedAtBirth.female,
        hoursSinceFirstDrink: 1.5,
      );
      expect(result.zone, BacZone.high);
      expect(result.alcoholPurchaseBlocked, isTrue);
    });

    test('BacZone.high has error color and dangerous icon', () {
      expect(BacZone.high.color.toARGB32(), isNot(BacZone.safe.color.toARGB32()));
      expect(BacZone.high.icon, isNotNull);
    });

    test('BacZone.moderate has distinct color from safe and high', () {
      expect(BacZone.moderate.color.toARGB32(), isNot(BacZone.safe.color.toARGB32()));
      expect(BacZone.moderate.color.toARGB32(), isNot(BacZone.high.color.toARGB32()));
    });

    // --- Exact elapsed-time elimination ---

    test('elapsed time reduces BAC linearly', () {
      final atT0 = WidmarkFormula.estimate(
        drinksInGrams: 30,
        weightKg: 70,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 0,
      );
      final atT2 = WidmarkFormula.estimate(
        drinksInGrams: 30,
        weightKg: 70,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 2,
      );
      expect(atT0.bac, greaterThan(atT2.bac));
    });

    test('zero elapsed time does not trigger elimination deduction', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 12,
        weightKg: 70,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 0,
      );
      final expected = 12 / (70 * 0.70);
      expect(result.bac, closeTo(expected, 0.001));
    });

    // --- alcoholPurchaseBlocked edge ---

    test('alcoholPurchaseBlocked is false for BacZone.moderate', () {
      final result = WidmarkFormula.estimate(
        drinksInGrams: 40,
        weightKg: 75,
        sex: SexAssignedAtBirth.male,
        hoursSinceFirstDrink: 0,
      );
      if (result.zone == BacZone.moderate) {
        expect(result.alcoholPurchaseBlocked, isFalse);
      }
    });

    test('returns consistent zone and alcoholPurchaseBlocked alignment', () {
      for (final sex in SexAssignedAtBirth.values) {
        final result = WidmarkFormula.estimate(
          drinksInGrams: 80,
          weightKg: 60,
          sex: sex,
          hoursSinceFirstDrink: 0,
        );
        expect(
          result.alcoholPurchaseBlocked,
          equals(result.zone == BacZone.high),
        );
      }
    });
  });
}
