import 'dart:async';
import 'dart:math';
import '../domain/widmark_formula.dart';

abstract class SafetyRepository {
  Stream<int> get heartRateStream;
  Future<WidmarkResult> estimateBac({
    required double drinksInGrams,
    required double weightKg,
    required SexAssignedAtBirth sex,
    required double hoursSinceFirstDrink,
  });
  Future<void> dispatchSosAlert({required List<String> contactIds});
  Future<void> declareNoPulseResolved();
}

class DemoSafetyRepository implements SafetyRepository {
  final _rng = Random();

  @override
  Stream<int> get heartRateStream async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      yield 65 + _rng.nextInt(30);
    }
  }

  @override
  Future<WidmarkResult> estimateBac({
    required double drinksInGrams,
    required double weightKg,
    required SexAssignedAtBirth sex,
    required double hoursSinceFirstDrink,
  }) async {
    return WidmarkFormula.estimate(
      drinksInGrams: drinksInGrams,
      weightKg: weightKg,
      sex: sex,
      hoursSinceFirstDrink: hoursSinceFirstDrink,
    );
  }

  @override
  Future<void> dispatchSosAlert({required List<String> contactIds}) async {
    // Demo: no-op — real impl calls Supabase Edge Function dispatch-alert
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> declareNoPulseResolved() async {
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
